import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';

class QuizHistoryScreen extends StatelessWidget {
  const QuizHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ HISTORY'),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          final results = quizProvider.userResults;

          if (results.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 80,
                    color: AppTheme.textGray,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'NO QUIZ HISTORY YET',
                    style: TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Complete your first quiz to see it here',
                    style: TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              final quiz = quizProvider.getQuizById(result.quizId);
              
              if (quiz == null) return const SizedBox.shrink();

              final passed = result.isPassed(quiz.passingScore);

              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryMedium,
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(
                    color: passed 
                        ? AppTheme.success.withOpacity(0.3)
                        : AppTheme.error.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    onTap: () {
                      _showResultDetails(context, result, quiz);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Category icon
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: passed 
                                      ? AppTheme.success.withOpacity(0.1)
                                      : AppTheme.error.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                                ),
                                child: Icon(
                                  _getCategoryIcon(quiz.category),
                                  color: passed ? AppTheme.success : AppTheme.error,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              
                              // Quiz info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      quiz.title.toUpperCase(),
                                      style: const TextStyle(
                                        color: AppTheme.textLight,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _getCategoryName(quiz.category),
                                      style: const TextStyle(
                                        color: AppTheme.textGray,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Score badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: passed 
                                      ? AppTheme.success.withOpacity(0.2)
                                      : AppTheme.error.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                                ),
                                child: Text(
                                  '${result.percentage.toStringAsFixed(0)}%',
                                  style: TextStyle(
                                    color: passed ? AppTheme.success : AppTheme.error,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 12),
                          
                          // Stats row
                          Row(
                            children: [
                              _MiniStat(
                                icon: Icons.check_circle_outline,
                                value: '${result.correctAnswers}/${result.totalQuestions}',
                                color: AppTheme.success,
                              ),
                              const SizedBox(width: 16),
                              _MiniStat(
                                icon: Icons.stars,
                                value: '${result.score} pts',
                                color: AppTheme.accentGold,
                              ),
                              const SizedBox(width: 16),
                              _MiniStat(
                                icon: Icons.timer_outlined,
                                value: _formatTime(result.timeTaken),
                                color: AppTheme.textGray,
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 12),
                          
                          // Date
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                size: 12,
                                color: AppTheme.textGray,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _formatDate(result.completedAt),
                                style: const TextStyle(
                                  color: AppTheme.textGray,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showResultDetails(BuildContext context, QuizResult result, Quiz quiz) {
    final passed = result.isPassed(quiz.passingScore);
    
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.primaryDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.sharpRadius),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  passed ? Icons.check_circle : Icons.cancel,
                  color: passed ? AppTheme.success : AppTheme.error,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        quiz.title.toUpperCase(),
                        style: const TextStyle(
                          color: AppTheme.textLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        passed ? 'PASSED' : 'FAILED',
                        style: TextStyle(
                          color: passed ? AppTheme.success : AppTheme.error,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            _DetailRow(
              label: 'Score',
              value: '${result.score} / ${result.totalPoints} points',
            ),
            const SizedBox(height: 12),
            _DetailRow(
              label: 'Percentage',
              value: '${result.percentage.toStringAsFixed(1)}%',
            ),
            const SizedBox(height: 12),
            _DetailRow(
              label: 'Correct Answers',
              value: '${result.correctAnswers} / ${result.totalQuestions}',
            ),
            const SizedBox(height: 12),
            _DetailRow(
              label: 'Time Taken',
              value: _formatTime(result.timeTaken),
            ),
            const SizedBox(height: 12),
            _DetailRow(
              label: 'Completed',
              value: _formatDate(result.completedAt),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(QuizCategory category) {
    switch (category) {
      case QuizCategory.dealerBasics:
        return Icons.casino;
      case QuizCategory.cardHandling:
        return Icons.style;
      case QuizCategory.chipManagement:
        return Icons.adjust;
      case QuizCategory.customerService:
        return Icons.casino_outlined;
      case QuizCategory.gameRules:
        return Icons.diamond;
      case QuizCategory.casinoProtocol:
        return Icons.square;
      case QuizCategory.general:
        return Icons.quiz;
      case QuizCategory.casinoMath:
        return Icons.calculate;
      case QuizCategory.securityProcedures:
        return Icons.security;
      case QuizCategory.specialtyGames:
        return Icons.stars;
      case QuizCategory.dealerPsychology:
        return Icons.psychology;
    }
  }

  String _getCategoryName(QuizCategory category) {
    switch (category) {
      case QuizCategory.dealerBasics:
        return 'Dealer Basics';
      case QuizCategory.cardHandling:
        return 'Card Handling';
      case QuizCategory.chipManagement:
        return 'Chip Management';
      case QuizCategory.customerService:
        return 'Customer Service';
      case QuizCategory.gameRules:
        return 'Game Rules';
      case QuizCategory.casinoProtocol:
        return 'Casino Protocol';
      case QuizCategory.general:
        return 'General Knowledge';
      case QuizCategory.casinoMath:
        return 'Casino Math';
      case QuizCategory.securityProcedures:
        return 'Security Procedures';
      case QuizCategory.specialtyGames:
        return 'Specialty Games';
      case QuizCategory.dealerPsychology:
        return 'Dealer Psychology';
    }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes}m ${remainingSeconds}s';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const _MiniStat({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textGray,
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppTheme.textLight,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
