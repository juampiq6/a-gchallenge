import 'package:aandgchallenge/models/word_meaning.dart';

class WordResponseDTO {
  final String word;
  final List<WordMeaning> meanings;

  WordResponseDTO({required this.word, required this.meanings});

  factory WordResponseDTO.fromJson(Map<String, dynamic> json) {
    return WordResponseDTO(
      word: json['word'],
      meanings: json['meanings']
          .map<WordMeaning>((meaning) => WordMeaning.fromJson(meaning))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'meanings': meanings.map((e) => e.toJson()).toList(),
    };
  }
}
