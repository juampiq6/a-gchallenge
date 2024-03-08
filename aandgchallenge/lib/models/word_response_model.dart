import 'package:aandgchallenge/models/word_meaning.dart';
import 'package:aandgchallenge/models/word_response_dto.dart';

class WordResponseModel {
  final String word;
  final List<WordMeaning> meanings;

  WordResponseModel({required this.word, required this.meanings});

  factory WordResponseModel.fromDTO(WordResponseDTO dto) {
    return WordResponseModel(
      word: dto.word,
      meanings: dto.meanings,
    );
  }
}
