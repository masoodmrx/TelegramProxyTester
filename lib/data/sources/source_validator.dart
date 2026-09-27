import 'package:dio/dio.dart';

class SourceValidationResult {
  const SourceValidationResult({required this.accepted, required this.sourceType, required this.status, required this.message});
  final bool accepted;
  final String sourceType;
  final String status;
  final String message;
}

class SourceValidator {
  Future<SourceValidationResult> validate(String value, {required bool enabled}) async {
    final uri = Uri.tryParse(value);
    if (uri == null || !{'http', 'https'}.contains(uri.scheme) || uri.host.isEmpty) {
      return const SourceValidationResult(accepted: false, sourceType: 'txt_file', status: 'invalid_url', message: 'The URL is not valid.');
    }
    final isGithub = uri.host.toLowerCase() == 'github.com' && uri.pathSegments.length >= 2;
    final sourceType = isGithub ? 'github_repository' : 'txt_file';
    if (!enabled) return SourceValidationResult(accepted: true, sourceType: sourceType, status: 'validation_skipped', message: '');
    try {
      final dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 8), receiveTimeout: const Duration(seconds: 12), followRedirects: true));
      if (isGithub) {
        final owner = uri.pathSegments[0];
        final repo = uri.pathSegments[1].replaceFirst(RegExp(r'\.git$'), '');
        final response = await dio.get<Map<String, dynamic>>('https://api.github.com/repos/$owner/$repo');
        if (response.statusCode != 200) throw StateError('GitHub repository was not found.');
      } else {
        final response = await dio.get<String>(value, options: Options(responseType: ResponseType.plain));
        final body = response.data ?? '';
        if (response.statusCode != 200 || !RegExp(r'(tg://proxy|t\.me/proxy)', caseSensitive: false).hasMatch(body)) {
          throw StateError('The response is not a supported Telegram proxy TXT file.');
        }
      }
      return SourceValidationResult(accepted: true, sourceType: sourceType, status: 'validated', message: '');
    } catch (error) {
      return SourceValidationResult(accepted: false, sourceType: sourceType, status: 'validation_failed', message: 'Validation failed: $error');
    }
  }
}
