import '../models/quiz.dart';
import 'quiz_service_part1.dart';
import 'quiz_service_part2.dart';
import 'quiz_service_part3.dart';
import 'quiz_service_part4.dart';
import 'quiz_service_part5.dart';
import 'quiz_service_part6.dart';
import 'quiz_service_part7.dart';
import 'quiz_service_part8.dart';
import 'quiz_service_part9.dart';

class QuizService {
  // Compile all quizzes from different parts
  static final List<Quiz> _allQuizzes = [
    // Dealer Basics (2 beginner from part1)
    ...dealerBasicsQuizzes,
    // Card Handling (2: beginner, intermediate from part2)
    ...cardHandlingQuizzes,
    // Chip Management (2: beginner, intermediate from part2)
    ...chipManagementQuizzes,
    // Customer Service (2: beginner, intermediate from part3)
    ...customerServiceQuizzes,
    // Game Rules (3: beginner, intermediate, advanced from part3)
    ...gameRulesQuizzes,
    // Casino Protocol (3: beginner, intermediate, advanced from part4)
    ...casinoProtocolQuizzes,
    // General Knowledge (3: beginner, intermediate, expert from part4)
    ...generalKnowledgeQuizzes,
    // Additional quizzes from part5 (Advanced levels for existing categories)
    ...additionalQuizzesPart5,
    // Casino Math (4: beginner, intermediate, advanced, expert from part6)
    ...casinoMathQuizzes,
    // Security Procedures (4: beginner, intermediate, advanced, expert from part7)
    ...securityProceduresQuizzes,
    // Specialty Games (4: beginner, intermediate, advanced, expert from part8)
    ...specialtyGamesQuizzes,
    // Dealer Psychology (4: beginner, intermediate, advanced, expert from part9)
    ...dealerPsychologyQuizzes,
  ];

  // Total: 37 comprehensive quizzes across 11 categories and all difficulty levels
  
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
