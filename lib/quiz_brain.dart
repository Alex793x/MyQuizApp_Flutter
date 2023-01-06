import 'question.dart';

int _questionNumber = 0;

class QuizQuestions {
  List<Question> _questionsWithAnswers = [
    Question(question: 'The capital of Egypt is Cairo.', answer: true),
    Question(
        question: 'The Greek god Zeus is the god of the sea.', answer: false),
    Question(
        question:
            'The Roman emperor Julius Caesar was assassinated on the Ides of March.',
        answer: true),
    Question(
        question: 'The sport of soccer is also known as football.',
        answer: true),
    Question(
        question:
            'The color of the sky is caused by the reflection of the oceans.',
        answer: false),
    Question(
        question: 'The Asgardian god Thor is the god of wisdom.',
        answer: false),
    Question(
        question: 'You can lead a cow downstairs, but not upstairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
    Question(
        question: 'The Earth has eight planets in its solar system.',
        answer: false),
    Question(
        question: 'The Asgardian god Vidar is the god of silence.',
        answer: false),
    Question(
        question: 'The sport of swimming is one of the oldest Olympic sports.',
        answer: true),
    Question(
        question: 'The sport of tennis originated in France.', answer: true),
  ];

  String getQuestionText() {
    return _questionsWithAnswers[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questionsWithAnswers[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionsWithAnswers.length) {
      _questionNumber += 1;
    }
  }

  set questionsWithAnswers(List<Question> question) =>
      _questionsWithAnswers = question;

  set questionNumber(int value) => _questionNumber = value;
}
