import 'package:aandgchallenge/models/word_definition.dart';

class WordMeaning {
  final String partOfSpeech;
  final List<String> synonyms;
  final List<String> antonyms;
  final List<WordDefinition> definitions;

  WordMeaning({
    required this.partOfSpeech,
    required this.synonyms,
    required this.antonyms,
    required this.definitions,
  });

  factory WordMeaning.fromJson(Map<String, dynamic> json) {
    return WordMeaning(
      partOfSpeech: json['partOfSpeech'],
      synonyms: json['synonyms'].cast<String>(),
      antonyms: json['antonyms'].cast<String>(),
      definitions: json['definitions']
          .map<WordDefinition>((def) => WordDefinition.fromJson(def))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partOfSpeech': partOfSpeech,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'definitions': definitions.map((e) => e.toJson()).toList(),
    };
  }
}
