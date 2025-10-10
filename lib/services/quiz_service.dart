import '../models/quiz.dart';
import 'quiz_service_part1.dart';
import 'quiz_service_part2.dart';
import 'quiz_service_part3.dart';
import 'quiz_service_part4.dart';

class QuizService {
  // Compile all quizzes from different parts
  static final List<Quiz> _allQuizzes = [
    // Dealer Basics (2 beginner)
    ...dealerBasicsQuizzes,
    // Card Handling (2: beginner, intermediate)
    ...cardHandlingQuizzes,
    // Chip Management (2: beginner, intermediate)
    ...chipManagementQuizzes,
    // Customer Service (2: beginner, intermediate)
    ...customerServiceQuizzes,
    // Game Rules (3: beginner, intermediate, advanced)
    ...gameRulesQuizzes,
    // Casino Protocol (3: beginner, intermediate, advanced)
    ...casinoProtocolQuizzes,
    // General Knowledge (3: beginner, intermediate, expert)
    ...generalKnowledgeQuizzes,
  ];

  // Total: 17 quizzes across all categories and difficulty levels
  
  List<Quiz> getQuizzesByCategory(QuizCategory category) {
    return _allQuizzes.where((quiz) => quiz.category == category).toList();
  }

  Quiz? getQuizById(String id) {
    try {
      return _allQuizzes.firstWhere((quiz) => quiz.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Quiz> getAllQuizzes() {
    return _allQuizzes;
  }

  int getTotalQuizCount() {
    return _allQuizzes.length;
  }

  List<Quiz> getQuizzesByDifficulty(DifficultyLevel difficulty) {
    return _allQuizzes.where((quiz) => quiz.difficulty == difficulty).toList();
  }

  List<Quiz> getUnlockedQuizzes(int totalScore) {
    return _allQuizzes.where((quiz) => totalScore >= quiz.requiredScore).toList();
  }

  Future<List<QuizResult>> getUserResults(String userId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    // Return mock results or fetch from API
    return [];
  }

  Future<void> submitQuizResult(QuizResult result) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    // Submit to API in production
  }
}
