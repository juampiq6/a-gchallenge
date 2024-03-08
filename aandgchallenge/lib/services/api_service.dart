import 'dart:convert';

import 'package:aandgchallenge/models/word_response_dto.dart';
import 'package:aandgchallenge/services/env_vars.dart';
import 'package:http/http.dart' as http;

class DictionaryApiService {
  late final String apiUrl;
  final http.Client httpClient;
  DictionaryApiService({String? baseUrl, String? lang, http.Client? client})
      : apiUrl = (baseUrl ?? EnvVars.baseUrl) + (lang ?? EnvVars.lang),
        httpClient = client ?? http.Client();

  Future<List<WordResponseDTO>> getDefinitions(String word) async {
    try {
      final response = await httpClient.get(Uri.parse('$apiUrl/$word'));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        return body
            .map((dynamic item) => WordResponseDTO.fromJson(item))
            .toList();
      } else {
        if (response.statusCode == 404) {
          throw ApiError(code: 404, message: "Word not found");
        } else {
          throw ApiError(
              code: response.statusCode,
              message: "An unknown server error occurred");
        }
      }
    } catch (e) {
      if (e is ApiError) rethrow;
      throw ApiError(code: 500, message: "Error ocurred in the server request");
    }
  }
}

class ApiError {
  final int code;
  final String message;

  ApiError({required this.code, required this.message});
}
