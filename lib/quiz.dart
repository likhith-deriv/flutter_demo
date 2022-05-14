import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => (Answer(
                answerText: answer['text'] as String,
                selectHandler: () => answerQuestion(answer['score'] as int))))
            .toList()
      ],
    );
  }
}
