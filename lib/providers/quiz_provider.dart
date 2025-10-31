import 'package:flutter/foundation.dart';
import '../models/quiz.dart';
import '../services/quiz_service.dart';

class QuizProvider with ChangeNotifier {
  final QuizService _quizService = QuizService();

  List<Quiz> _allQuizzes = [];
  Quiz? _currentQuiz;
  int _currentQuestionIndex = 0;
  Map<int, int> _userAnswers = {};
  int _timeRemaining = 0;
  bool _isQuizActive = false;
  List<QuizResult> _userResults = [];

  List<Quiz> get allQuizzes => _allQuizzes;
  Quiz? get currentQuiz => _currentQuiz;
  int get currentQuestionIndex => _currentQuestionIndex;
  Map<int, int> get userAnswers => _userAnswers;
  int get timeRemaining => _timeRemaining;
  bool get isQuizActive => _isQuizActive;
  List<QuizResult> get userResults => _userResults;

  Question? get currentQuestion {
    if (_currentQuiz == null ||
        _currentQuestionIndex >= _currentQuiz!.questions.length) {
      return null;
    }
    return _currentQuiz!.questions[_currentQuestionIndex];
  }

  bool get isLastQuestion {
    if (_currentQuiz == null) return false;
    return _currentQuestionIndex >= _currentQuiz!.questions.length - 1;
  }

  void loadQuizzes() {
    _allQuizzes = _quizService.getAllQuizzes();
    notifyListeners();
  }

  List<Quiz> getQuizzesByCategory(QuizCategory category) {
    return _quizService.getQuizzesByCategory(category);
  }

  Quiz? getQuizById(String quizId) {
    try {
      return _allQuizzes.firstWhere((quiz) => quiz.id == quizId);
    } catch (e) {
      return null;
    }
  }

  bool isQuizCompleted(String quizId) {
    return _userResults.any(
      (result) => result.quizId == quizId && result.percentage >= 100,
    );
  }

  QuizResult? getBestResult(String quizId) {
    final results = _userResults.where((r) => r.quizId == quizId).toList();
    if (results.isEmpty) return null;

    results.sort((a, b) => b.score.compareTo(a.score));
    return results.first;
  }

  void startQuiz(Quiz quiz) {
    _currentQuiz = quiz;
    _currentQuestionIndex = 0;
    _userAnswers = {};
    _timeRemaining = quiz.timeLimit;
    _isQuizActive = true;
    notifyListeners();
  }

  void clearQuiz() {
    _currentQuiz = null;
    _currentQuestionIndex = 0;
    _userAnswers = {};
    _timeRemaining = 0;
    _isQuizActive = false;
    notifyListeners();
  }

  void answerQuestion(int answerIndex) {
    if (_currentQuiz == null || !_isQuizActive) return;
    _userAnswers[_currentQuestionIndex] = answerIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuiz == null || !_isQuizActive) return;
    if (_currentQuestionIndex < _currentQuiz!.questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (_currentQuiz == null || !_isQuizActive) return;
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void goToQuestion(int index) {
    if (_currentQuiz == null || !_isQuizActive) return;
    if (index >= 0 && index < _currentQuiz!.questions.length) {
      _currentQuestionIndex = index;
      notifyListeners();
    }
  }

  QuizResult? submitQuiz(String userId) {
    if (_currentQuiz == null || !_isQuizActive) return null;

    int correctAnswers = 0;
    int totalScore = 0;

    for (int i = 0; i < _currentQuiz!.questions.length; i++) {
      final question = _currentQuiz!.questions[i];
      final userAnswer = _userAnswers[i];

      if (userAnswer != null && userAnswer == question.correctAnswerIndex) {
        correctAnswers++;
        totalScore += question.points;
      }
    }

    final result = QuizResult(
      quizId: _currentQuiz!.id,
      userId: userId,
      score: totalScore,
      totalPoints: _currentQuiz!.totalPoints,
      correctAnswers: correctAnswers,
      totalQuestions: _currentQuiz!.questions.length,
      completedAt: DateTime.now(),
      timeTaken: _currentQuiz!.timeLimit - _timeRemaining,
    );

    _isQuizActive = false;
    _quizService.submitQuizResult(result);

    // Add to history (keep last 50)
    _userResults.insert(0, result);
    if (_userResults.length > 50) {
      _userResults.removeLast();
    }

    notifyListeners();

    return result;
  }

  void updateTime(int seconds) {
    _timeRemaining = seconds;
    if (_timeRemaining <= 0 && _isQuizActive) {
      _isQuizActive = false;
    }
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuiz = null;
    _currentQuestionIndex = 0;
    _userAnswers = {};
    _timeRemaining = 0;
    _isQuizActive = false;
    notifyListeners();
  }

  Future<void> loadUserResults(String userId) async {
    _userResults = await _quizService.getUserResults(userId);
    notifyListeners();
  }
}
