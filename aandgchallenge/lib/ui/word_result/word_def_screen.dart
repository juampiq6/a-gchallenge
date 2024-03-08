import 'package:aandgchallenge/providers/word_def_prov.dart';
import 'package:aandgchallenge/services/api_service.dart';
import 'package:aandgchallenge/ui/word_result/word_info_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordDefinitionScreen extends StatelessWidget {
  final String word;

  const WordDefinitionScreen({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final results = ref.watch(wordDefinitionProv(word));
          if (results.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (results.hasError) {
            if (results.error is ApiError) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sorry',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text((results.error as ApiError).message),
                ],
              ));
            }
          }
          if (results.asData == null || !results.asData!.hasValue) {
            return const Center(child: Text('No data'));
          }
          final list = results.asData!.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return WordInfoBox(
                wordResponseModel: list[index],
              );
            },
          );
        },
      ),
    );
  }
}
