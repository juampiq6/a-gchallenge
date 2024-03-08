import 'package:aandgchallenge/models/exports.dart';
import 'package:flutter/material.dart';

class WordDefinitionBox extends StatelessWidget {
  final WordDefinition definition;

  const WordDefinitionBox({super.key, required this.definition});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                definition.definition,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              if (definition.synonyms.isNotEmpty)
                RichText(
                  text: TextSpan(
                    text: 'Syn: ',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: definition.synonyms.join(', '),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              if (definition.antonyms.isNotEmpty)
                RichText(
                  text: TextSpan(
                    text: 'Ant: ',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: definition.antonyms.join(', '),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              if (definition.example != null)
                Text(
                  'E.g. ${definition.example}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
