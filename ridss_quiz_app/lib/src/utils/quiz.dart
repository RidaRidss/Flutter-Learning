import './question.dart';

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  int get score => _score;
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex + 1;
  
  Quiz(this._questions) {
    _questions.shuffle();
  }

  Question get nextQuestion {
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= length) return null;
    return questions[_currentQuestionIndex];
  }
void answer(bool iscorrect){
  if(iscorrect) _score++;
}
}
