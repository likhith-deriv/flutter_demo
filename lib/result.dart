import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(
      {required this.resultScore, required this.resetHandler, Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are  awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else {
      resultText = 'You are ...strange';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: const Text('Restart Quiz!'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
