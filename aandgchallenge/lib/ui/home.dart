import 'package:aandgchallenge/ui/search_screen/search_input.dart';
import 'package:aandgchallenge/ui/word_result/word_def_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  navigateToWordScreen(BuildContext context, String word) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WordDefinitionScreen(word: word);
        },
      ),
    );
  }

  showErrorEmptyInput(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a word'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A&G Challenge - Dictionary'),
      ),
      body: Center(
        child: SearchInput(
          onSubmitted: (value) {
            if (value != null) {
              navigateToWordScreen(context, value);
            } else {
              showErrorEmptyInput(context);
            }
          },
        ),
      ),
    );
  }
}
