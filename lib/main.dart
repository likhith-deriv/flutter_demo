import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Rabbit', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite dish?',
      'answers': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Burger', 'score': 5},
        {'text': 'Cake', 'score': 3},
        {'text': 'Custard', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var isQuestionAvailable = true;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      isQuestionAvailable = true;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex > _questions.length - 2) {
      isQuestionAvailable = false;
    }
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('My First App'),
            ),
            body: isQuestionAvailable
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex)
                : Result(resultScore: _totalScore, resetHandler: _resetQuiz)));
  }
}
