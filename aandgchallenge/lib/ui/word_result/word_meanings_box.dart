import 'package:aandgchallenge/models/exports.dart';
import 'package:aandgchallenge/ui/word_result/word_def_box.dart';
import 'package:flutter/material.dart';

class WordMeaningBox extends StatelessWidget {
  final List<WordMeaning> meanings;

  const WordMeaningBox({super.key, required this.meanings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final meaning in meanings)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meaning.partOfSpeech,
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 4),
                if (meaning.synonyms.isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Synonyms',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(child: Text(meaning.synonyms.join(', '))),
                    ],
                  ),
                if (meaning.antonyms.isNotEmpty)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Antonyms',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Expanded(child: Text(meaning.antonyms.join(', '))),
                    ],
                  ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: [
                    for (final def in meaning.definitions)
                      WordDefinitionBox(
                        definition: def,
                      ),
                  ],
                ),
                const SizedBox(height: 18),
              ],
            ),
        ],
      ),
    );
  }
}
