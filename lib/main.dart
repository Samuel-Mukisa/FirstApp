import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      //Maps between  a key and a value
      {
        'questionText': "What is your favorite color ?",
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 15},
          {'text': 'Green', 'score': 20},
          {'text': 'White', 'score': 30}
        ],
      },
      {
        'questionText': "What i s your favorite animal?",
        'answers': [
          {'text': 'Elephant', 'score': 50},
          {'text': 'Rabbit', 'score': 10},
          {'text': 'Snake', 'score': 20},
          {'text': 'Lion', 'score': 60}
        ],
      },
      {
        'questionText': "What is your favorite meal?",
        'answers': [
          {'text': 'Beef', 'score': 50},
          {'text': 'Chicken', 'score': 60},
          {'text': 'Beans', 'score': 70},
          {'text': 'Groundnuts', 'score': 40}
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MyQuiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
