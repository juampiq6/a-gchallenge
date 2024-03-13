import 'dart:io';

import 'package:aandgchallenge/providers/api_service_prov.dart';
import 'package:aandgchallenge/providers/word_def_prov.dart';
import 'package:aandgchallenge/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

void main() {
  late final DictionaryApiService mockApiService;

  setUpAll(() {
    mockApiService = DictionaryApiService(
      client: MockClient((request) async {
        return http.Response(
          cumbersomeSearchResult,
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        );
      }),
    );
  });
  test(
    'Word Definition Provider Data Test',
    () async {
      final container = createContainer(
        overrides: [
          dictionaryApiServiceProv.overrideWith((ref) {
            return mockApiService;
          }),
        ],
      );

      await expectLater(
        container.read(wordDefinitionProv('cumbersome').future),
        completion(allOf(
          isNotNull,
          isNotEmpty,
        )),
      );
    },
  );
}

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  addTearDown(container.dispose);
  return container;
}

const cumbersomeSearchResult =
    '''[{"word":"cumbersome","phonetic":"/ˈkʌmbɚsəm/","phonetics":[{"text":"/ˈkʌmbɚsəm/","audio":""}],"meanings":[{"partOfSpeech":"adjective","definitions":[{"definition":"Burdensome or hindering, as a weight or drag; vexatious","synonyms":[],"antonyms":[]},{"definition":"Not easily managed or handled; awkward; clumsy.","synonyms":[],"antonyms":[],"example":"Cumbersome machines can endanger operators and slow down production."},{"definition":"Hard, difficult, demanding to handle or get around with.","synonyms":[],"antonyms":[],"example":"A slaves' work was as cumbersome as toiling on the fields, or in the mines."},{"definition":"Inert, lumbering, slow in movement","synonyms":[],"antonyms":[]}],"synonyms":["cumbrous","unwieldy"],"antonyms":[]}],"license":{"name":"CC BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"},"sourceUrls":["https://en.wiktionary.org/wiki/cumbersome"]}]''';
