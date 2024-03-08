import 'package:aandgchallenge/models/word_response_model.dart';
import 'package:aandgchallenge/ui/word_result/word_meanings_box.dart';
import 'package:flutter/material.dart';

class WordInfoBox extends StatelessWidget {
  final WordResponseModel wordResponseModel;
  const WordInfoBox({super.key, required this.wordResponseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(
        bottom: 15,
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WordMeaningBox(meanings: wordResponseModel.meanings),
        ],
      ),
    );
  }
}
