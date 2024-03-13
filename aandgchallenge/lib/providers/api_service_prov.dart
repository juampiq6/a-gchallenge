import 'package:aandgchallenge/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dictionaryApiServiceProv = Provider<DictionaryApiService>((ref) {
  return DictionaryApiService();
});
