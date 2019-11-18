import 'package:flutter/material.dart';

import './UI/answer_buttons.dart';
import './UI/question_text.dart';
import './UI/correct_wrong_overlay.dart';

import '../utils/quiz.dart';
import '../utils/question.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;

  Quiz quiz = new Quiz([
    new Question("React Native is library", false),
    new Question("Flutter is web app", false),
    new Question("Ionic will be obselete from market by 2030", true),
    new Question("Flutter make widget apps", true),
    new Question("Apps Developers are exited to pick flutter", true)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overLayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overLayShouldBeVisible = true;
    });
  }

  void handleOverLay() {
    currentQuestion = quiz.nextQuestion;
    if (quiz.length == questionNumber) {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) =>
                  new ScorePage(quiz.score, quiz.length)),
          (Route route) => route == null);
      return;
    }
    this.setState(() {
      overLayShouldBeVisible = false;
      questionText = currentQuestion.question;
      questionNumber = quiz.questionNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(children: <Widget>[
          new AnswerButton(true, () => handleAnswer(true)),
          new QuestionText(questionText, questionNumber),
          new AnswerButton(false, () => handleAnswer(false))
        ]),
        overLayShouldBeVisible == true
            ? new CorrectWrongOverlay(isCorrect, () => handleOverLay())
            : new Container()
      ],
    );
  }
}
