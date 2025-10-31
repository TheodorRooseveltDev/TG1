import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';
import 'quiz_list_screen.dart';

class QuizCategoriesScreen extends StatelessWidget {
  const QuizCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 120.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryMedium,
                borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                border: Border.all(
                  color: AppTheme.accentGold.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.accentGold.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    ),
                    child: const Icon(
                      Icons.quiz,
                      color: AppTheme.accentGold,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'QUIZ CATEGORIES',
                          style: TextStyle(
                            color: AppTheme.accentGold,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Consumer<QuizProvider>(
                          builder: (context, quizProvider, child) {
                            return Text(
                              '${QuizCategory.values.length} categories • ${quizProvider.allQuizzes.length} quizzes',
                              style: const TextStyle(
                                color: AppTheme.textGray,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Categories grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
              ),
              itemCount: QuizCategory.values.length,
              itemBuilder: (context, index) {
                final category = QuizCategory.values[index];
                return _CategoryCard(category: category);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final QuizCategory category;

  const _CategoryCard({required this.category});

  IconData _getCategoryIcon() {
    switch (category) {
      case QuizCategory.dealerBasics:
        return Icons.person;
      case QuizCategory.cardHandling:
        return Icons.style;
      case QuizCategory.chipManagement:
        return Icons.monetization_on;
      case QuizCategory.customerService:
        return Icons.support_agent;
      case QuizCategory.gameRules:
        return Icons.casino;
      case QuizCategory.casinoProtocol:
        return Icons.rule;
      case QuizCategory.general:
        return Icons.school;
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

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final quizCount = quizProvider.getQuizzesByCategory(category).length;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizListScreen(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryMedium,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
          border: Border.all(
            color: AppTheme.primaryLight,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryLight,
                borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
              ),
              child: Icon(
                _getCategoryIcon(),
                size: 40,
                color: AppTheme.accentGold,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                category.title.toUpperCase(),
                style: const TextStyle(
                  color: AppTheme.textLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$quizCount QUIZZES',
              style: const TextStyle(
                color: AppTheme.textGray,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}