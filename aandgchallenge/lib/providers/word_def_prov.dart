import 'dart:async';

import 'package:aandgchallenge/models/word_response_model.dart';
import 'package:aandgchallenge/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final DictionaryApiService _apiService = DictionaryApiService();

final wordDefinitionProv = AsyncNotifierProvider.autoDispose
    .family<WordDefinitionProvider, List<WordResponseModel>, String>(
        WordDefinitionProvider.new);

class WordDefinitionProvider
    extends AutoDisposeFamilyAsyncNotifier<List<WordResponseModel>, String> {
  @override
  FutureOr<List<WordResponseModel>> build(String arg) async {
    try {
      final res = await _apiService.getDefinitions(arg);
      return res.map((e) => WordResponseModel.fromDTO(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
