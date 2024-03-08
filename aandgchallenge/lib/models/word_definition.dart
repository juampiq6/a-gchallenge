class WordDefinition {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  WordDefinition({
    required this.example,
    required this.synonyms,
    required this.antonyms,
    required this.definition,
  });

  factory WordDefinition.fromJson(Map<String, dynamic> json) {
    return WordDefinition(
      definition: json['definition'],
      synonyms: json['synonyms'].cast<String>(),
      antonyms: json['antonyms'].cast<String>(),
      example: json['example'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
      'example': example,
    };
  }
}
