import 'dart:io';

import 'package:aandgchallenge/services/api_service.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  group('API service tests', () {
    test('API Service test 200', () async {
      final client = MockClient((request) async {
        return http.Response(
            cumbersomeSearchResult,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
            200);
      });

      final res = await DictionaryApiService(
        baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/',
        lang: 'en',
        client: client,
      ).getDefinitions('cumbersome');

      expect(res, allOf(isNotNull, isNotEmpty));
    });

    test('API Service test 404', () async {
      final client = MockClient((request) async {
        return http.Response("", 404);
      });
      try {
        await DictionaryApiService(
          baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/',
          lang: 'en',
          client: client,
        ).getDefinitions('perro');
      } catch (e) {
        expect(e, isA<ApiError>());
      }
    });

    test('API Service test 500', () async {
      final client = MockClient((request) async {
        return http.Response("", 500);
      });
      try {
        await DictionaryApiService(
          baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/',
          lang: 'en',
          client: client,
        ).getDefinitions('500 error');
      } catch (e) {
        expect(e, isA<ApiError>());
      }
    });
  });
}

const cumbersomeSearchResult =
    '''[{"word":"cumbersome","phonetic":"/ˈkʌmbɚsəm/","phonetics":[{"text":"/ˈkʌmbɚsəm/","audio":""}],"meanings":[{"partOfSpeech":"adjective","definitions":[{"definition":"Burdensome or hindering, as a weight or drag; vexatious","synonyms":[],"antonyms":[]},{"definition":"Not easily managed or handled; awkward; clumsy.","synonyms":[],"antonyms":[],"example":"Cumbersome machines can endanger operators and slow down production."},{"definition":"Hard, difficult, demanding to handle or get around with.","synonyms":[],"antonyms":[],"example":"A slaves' work was as cumbersome as toiling on the fields, or in the mines."},{"definition":"Inert, lumbering, slow in movement","synonyms":[],"antonyms":[]}],"synonyms":["cumbrous","unwieldy"],"antonyms":[]}],"license":{"name":"CC BY-SA 3.0","url":"https://creativecommons.org/licenses/by-sa/3.0"},"sourceUrls":["https://en.wiktionary.org/wiki/cumbersome"]}]''';
