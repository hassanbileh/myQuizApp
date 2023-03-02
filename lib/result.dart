// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText;
    if (resultScore < 8) {
      resultText = 'T\'es aimable';
    } else if (resultScore <= 20 && resultScore >= 10) {
      resultText = 'T\'es normal';
    } else if (resultScore >= 20) {
      resultText = 'T\'es mauvais';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: () => resetQuiz() , child: Text('Reset'),)
        ],
      ),
    );
  }
}
