import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';
import 'quiz_play_screen.dart';

class QuizDetailScreen extends StatelessWidget {
  final Quiz quiz;

  const QuizDetailScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final minutes = quiz.timeLimit ~/ 60;
    final quizProvider = context.watch<QuizProvider>();
    final isCompleted = quizProvider.isQuizCompleted(quiz.id);
    final bestResult = quizProvider.getBestResult(quiz.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title.toUpperCase()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold,
                        borderRadius: BorderRadius.circular(
                          AppTheme.sharpRadius,
                        ),
                      ),
                      child: Text(
                        quiz.category.title.toUpperCase(),
                        style: const TextStyle(
                          color: AppTheme.primaryDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Title
                    Text(
                      quiz.title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppTheme.textLight,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Description
                    Text(
                      quiz.category.description,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: AppTheme.textGray),
                    ),

                    const SizedBox(height: 32),

                    // Info cards
                    Row(
                      children: [
                        Expanded(
                          child: _InfoCard(
                            icon: Icons.quiz,
                            label: 'QUESTIONS',
                            value: '${quiz.questions.length}',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _InfoCard(
                            icon: Icons.timer,
                            label: 'TIME LIMIT',
                            value: '$minutes min',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _InfoCard(
                            icon: Icons.stars,
                            label: 'TOTAL POINTS',
                            value: '${quiz.totalPoints}',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _InfoCard(
                            icon: Icons.flag,
                            label: 'PASSING',
                            value: '${quiz.passingScore}%',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Rules section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryMedium,
                        borderRadius: BorderRadius.circular(
                          AppTheme.sharpRadius,
                        ),
                        border: Border.all(
                          color: AppTheme.accentGold,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.info_outline,
                                color: AppTheme.accentGold,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'QUIZ RULES',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color: AppTheme.accentGold,
                                      letterSpacing: 1.0,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _RuleItem(
                            text:
                                'You have $minutes minutes to complete the quiz',
                          ),
                          _RuleItem(
                            text: 'Each question has only one correct answer',
                          ),
                          _RuleItem(
                            text: 'You can navigate between questions freely',
                          ),
                          _RuleItem(
                            text: 'Score ${quiz.passingScore}% or more to pass',
                          ),
                          _RuleItem(
                            text: 'Review explanations after completing',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Start button
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppTheme.primaryMedium,
                border: Border(
                  top: BorderSide(color: AppTheme.primaryLight, width: 1),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isCompleted && bestResult != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.success.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                            AppTheme.sharpRadius,
                          ),
                          border: Border.all(color: AppTheme.success, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppTheme.success,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'COMPLETED - Best Score: ${bestResult.percentage.toStringAsFixed(0)}%',
                              style: const TextStyle(
                                color: AppTheme.success,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<QuizProvider>().startQuiz(quiz);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizPlayScreen(),
                          ),
                        );
                      },
                      child: Text(isCompleted ? 'RETAKE QUIZ' : 'START QUIZ'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryMedium,
        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        border: Border.all(color: AppTheme.primaryLight, width: 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.accentGold, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textLight,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textGray,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _RuleItem extends StatelessWidget {
  final String text;

  const _RuleItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.accentGold,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textLight,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
