import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Lion', 'Elephant']
    },
    {
      'questionText': 'What\'s your favorite dish?',
      'answers': ['Custard', 'Cake', 'Burger', 'Pizza']
    }
  ];
  var _questionIndex = 0;
  var isQuestionAvailable = true;

  void _answerQuestion() {
    if (_questionIndex >= questions.length) {
      isQuestionAvailable = false;
    }
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('My First App'),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]['questionText'] as String),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) =>
                  (Answer(answerText: answer, selectHandler: _answerQuestion)))
              .toList()
        ],
      ),
    ));
  }
}
