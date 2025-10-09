import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';
import '../../providers/auth_provider.dart';
import 'quiz_detail_screen.dart';

class QuizListScreen extends StatelessWidget {
  final QuizCategory category;

  const QuizListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final authProvider = context.watch<AuthProvider>();
    final quizzes = quizProvider.getQuizzesByCategory(category);
    final allQuizzes = quizProvider.allQuizzes;
    final unlockedCount = authProvider.currentUser?.unlockedQuizCount ?? 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title.toUpperCase()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: quizzes.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.quiz,
                      size: 64,
                      color: AppTheme.textDark,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No quizzes available',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textGray,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: quizzes.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final quiz = quizzes[index];
                  // Get global index of this quiz
                  final globalIndex = allQuizzes.indexWhere((q) => q.id == quiz.id);
                  final isLocked = globalIndex >= unlockedCount;
                  final isCompleted = quizProvider.isQuizCompleted(quiz.id);
                  final bestResult = quizProvider.getBestResult(quiz.id);
                  return _QuizCard(
                    quiz: quiz,
                    isLocked: isLocked,
                    requiredLevel: _getRequiredLevel(globalIndex),
                    isCompleted: isCompleted,
                    bestScore: bestResult?.percentage.toInt(),
                  );
                },
              ),
      ),
    );
  }

  int _getRequiredLevel(int globalIndex) {
    if (globalIndex < 3) return 1;
    if (globalIndex < 6) return 3;
    if (globalIndex < 10) return 5;
    if (globalIndex < 15) return 7;
    return 9;
  }
}

class _QuizCard extends StatelessWidget {
  final Quiz quiz;
  final bool isLocked;
  final int requiredLevel;
  final bool isCompleted;
  final int? bestScore;

  const _QuizCard({
    required this.quiz,
    this.isLocked = false,
    this.requiredLevel = 1,
    this.isCompleted = false,
    this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = quiz.timeLimit ~/ 60;
    final questionCount = quiz.questions.length;

    return Opacity(
      opacity: isLocked ? 0.5 : 1.0,
      child: InkWell(
        onTap: isLocked
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Reach level $requiredLevel to unlock this quiz'),
                    backgroundColor: AppTheme.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizDetailScreen(quiz: quiz),
                  ),
                );
              },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.primaryMedium,
            borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
            border: Border.all(
              color: isLocked 
                  ? AppTheme.textGray.withOpacity(0.3)
                  : AppTheme.primaryLight,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.only(right: (isLocked || isCompleted) ? 100.0 : 0.0),
                    child: Text(
                      quiz.title.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.accentGold,
                        letterSpacing: 1.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Stats row
                  Row(
                    children: [
                      _QuizStat(
                        icon: Icons.quiz,
                        label: '$questionCount Questions',
                      ),
                      const SizedBox(width: 16),
                      _QuizStat(
                        icon: Icons.timer,
                        label: '$minutes min',
                      ),
                      const SizedBox(width: 16),
                      _QuizStat(
                        icon: Icons.flag,
                        label: '${quiz.passingScore}% to pass',
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Points
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryLight,
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    ),
                    child: Text(
                      'Total Points: ${quiz.totalPoints}',
                      style: const TextStyle(
                        color: AppTheme.textLight,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              
              // Lock overlay
              if (isLocked)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.error,
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.lock,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'LVL $requiredLevel',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              
              // Completed badge
              if (!isLocked && isCompleted)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.success,
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$bestScore%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizStat extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuizStat({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.textGray, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textGray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
