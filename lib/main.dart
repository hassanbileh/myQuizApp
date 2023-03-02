// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, duplicate_import, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:playground/answer.dart';
import 'package:playground/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  // creation du State
  @override
  State<myApp> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<myApp> {
  var _questions = [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Blue', 'score': 6},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Dog', 'score': 3},
        {'text': 'Cat', 'score': 1},
        {'text': 'Shark', 'score': 8},
        {'text': 'Lion', 'score': 9},
        {'text': 'Leopard', 'score': 10},
        {'text': 'Elephant', 'score': 5}
      ]
    },
    {
      'questionText': 'Who\'s your favorite teacher ?',
      'answers': [
        {'text': 'Max', 'score': 8},
        {'text': 'Tryhackme', 'score': 10},
        {'text': 'Marouene', 'score': 5},
        {'text': 'Ali', 'score': 6},
        {'text': 'Ahmed', 'score': 3},
        {'text': 'Zahra', 'score': 10}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _backQuiz() {
    setState(() {
      _questionIndex -= 1;
    });
  }

//Fonction de retour du boutton
  void _answerQuestion(int score) {
    _totalScore += score;
    // Set du State
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
