import 'package:aandgchallenge/models/word_response_model.dart';
import 'package:aandgchallenge/providers/api_service_prov.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wordDefinitionProv =
    FutureProvider.family<List<WordResponseModel>, String>((ref, arg) async {
  final apiService = ref.read(dictionaryApiServiceProv);
  final res = await apiService.getDefinitions(arg);
  return res.map((e) => WordResponseModel.fromDTO(e)).toList();
});
