import 'package:w5_e2quizzapp/question.dart';

class QuizBrain {
  //Hacemos privado a "question" para que a atravez de quizbrain no tengra acceso a todas las preguntas
  //de esta forma que se protege y solo la lista sea accessible dentro de esta clase

  final List<Question> _questions = [
    Question(
        questionText: "¿El río Nilo es el río más largo del mundo?", questionAnswear: true),
    Question(questionText: "¿La Gran Muralla China es visible desde la Luna?", questionAnswear: false),
    Question(questionText: "¿El Sol es una estrella?", questionAnswear: true),
    Question(questionText: "¿El pingüino es un mamífero?", questionAnswear: false),
  ];

  int _questionIndex = 0;

  //Metodos para EXTRAER preguntas y respuestas, solo lo necesario
  getQuestionText() {
    return _questions[_questionIndex].questionText;
  }
  getQuestionAnswear() {
    return _questions[_questionIndex].questionAnswear;
  }
  nextQuestion() {
    if (_questionIndex < _questions.length - 1) _questionIndex++;
  }

  //FUNCIOONALIDAD QUE VERIFICA SI EL QUIZZ TERMINÓ
  bool isdone() {
    if (_questionIndex >= _questions.length-1) return true;
    return false;
  }

  //METODO PARA REINICIAR EL QUIZ
  void restart() {
    _questionIndex = 0;
  }
}
