import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';
import '../../providers/auth_provider.dart';

class QuizResultScreen extends StatefulWidget {
  final QuizResult result;
  final bool wasAlreadyCompleted;

  const QuizResultScreen({
    super.key,
    required this.result,
    this.wasAlreadyCompleted = false,
  });

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  bool _hasAwardedXP = false;

  @override
  void initState() {
    super.initState();
    // Award XP when screen is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasAwardedXP) {
        _awardXP();
      }
    });
  }

  void _awardXP() {
    final authProvider = context.read<AuthProvider>();
    final quizProvider = context.read<QuizProvider>();
    final quiz = quizProvider.currentQuiz;

    if (quiz != null) {
      // Calculate XP based on performance
      final scorePercentage = (widget.result.score / widget.result.totalPoints);
      final baseXP = 50; // Base XP for completing quiz
      final bonusXP = (scorePercentage * 100).toInt(); // Bonus based on score
      final totalXP = baseXP + bonusXP;

      // Only award XP if not already completed with 100%
      if (!widget.wasAlreadyCompleted) {
        authProvider.updateUserStats(widget.result.score, totalXP);
      }

      setState(() {
        _hasAwardedXP = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final quiz = quizProvider.currentQuiz;
    final passed = widget.result.isPassed(quiz?.passingScore ?? 70);

    // Use the wasAlreadyCompleted flag from widget
    final wasAlreadyCompleted =
        widget.wasAlreadyCompleted && widget.result.percentage >= 100;

    // Calculate XP earned
    final scorePercentage = (widget.result.score / widget.result.totalPoints);
    final baseXP = 50;
    final bonusXP = (scorePercentage * 100).toInt();
    final totalXP = baseXP + bonusXP;

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) {
          quizProvider.resetQuiz();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QUIZ RESULTS'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.textLight),
            onPressed: () {
              quizProvider.resetQuiz();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Result icon
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: passed
                              ? AppTheme.success.withOpacity(0.1)
                              : AppTheme.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            AppTheme.sharpRadius,
                          ),
                        ),
                        child: Icon(
                          passed ? Icons.check_circle : Icons.cancel,
                          size: 80,
                          color: passed ? AppTheme.success : AppTheme.error,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Status text
                      Text(
                        passed ? 'CONGRATULATIONS!' : 'BETTER LUCK NEXT TIME',
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(
                              color: passed ? AppTheme.success : AppTheme.error,
                            ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        passed
                            ? 'You passed the quiz!'
                            : 'You didn\'t pass this time',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.textGray,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // XP Earned Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryMedium,
                          borderRadius: BorderRadius.circular(
                            AppTheme.sharpRadius,
                          ),
                          border: Border.all(
                            color: AppTheme.accentGold.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.stars,
                              color: AppTheme.accentGold,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'XP EARNED',
                                  style: TextStyle(
                                    color: AppTheme.textGray,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  wasAlreadyCompleted
                                      ? 'ALREADY COMPLETED'
                                      : '+$totalXP XP',
                                  style: TextStyle(
                                    color: wasAlreadyCompleted
                                        ? AppTheme.textGray
                                        : AppTheme.accentGold,
                                    fontSize: wasAlreadyCompleted ? 16 : 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            Text(
                              wasAlreadyCompleted
                                  ? '(No XP)'
                                  : '(50 base + bonus)',
                              style: const TextStyle(
                                color: AppTheme.textGray,
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Score card
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryMedium,
                          borderRadius: BorderRadius.circular(
                            AppTheme.sharpRadius,
                          ),
                          border: Border.all(
                            color: AppTheme.accentGold,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'YOUR SCORE',
                              style: const TextStyle(
                                color: AppTheme.textGray,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${widget.result.percentage.toStringAsFixed(1)}%',
                              style: const TextStyle(
                                color: AppTheme.accentGold,
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${widget.result.score} / ${widget.result.totalPoints} points',
                              style: const TextStyle(
                                color: AppTheme.textLight,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Statistics
                      Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              icon: Icons.check_circle,
                              label: 'CORRECT',
                              value: '${widget.result.correctAnswers}',
                              color: AppTheme.success,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatCard(
                              icon: Icons.cancel,
                              label: 'WRONG',
                              value:
                                  '${widget.result.totalQuestions - widget.result.correctAnswers}',
                              color: AppTheme.error,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              icon: Icons.timer,
                              label: 'TIME TAKEN',
                              value: _formatTime(widget.result.timeTaken),
                              color: AppTheme.accentGold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatCard(
                              icon: Icons.quiz,
                              label: 'TOTAL',
                              value: '${widget.result.totalQuestions}',
                              color: AppTheme.textGray,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Review answers section
                      if (quiz != null) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryMedium,
                            borderRadius: BorderRadius.circular(
                              AppTheme.sharpRadius,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.assignment,
                                    color: AppTheme.accentGold,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'ANSWER REVIEW',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: AppTheme.accentGold,
                                          letterSpacing: 1.0,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                quiz.questions.length,
                                (index) => _QuestionReview(
                                  questionNumber: index + 1,
                                  question: quiz.questions[index],
                                  userAnswer: quizProvider.userAnswers[index],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Action buttons
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppTheme.primaryMedium,
                  border: Border(
                    top: BorderSide(color: AppTheme.primaryLight, width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          quizProvider.resetQuiz();
                          // Navigate back to home screen
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        },
                        child: const Text('BACK TO HOME'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes}m ${secs}s';
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
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
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 20,
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
          ),
        ],
      ),
    );
  }
}

class _QuestionReview extends StatelessWidget {
  final int questionNumber;
  final Question question;
  final int? userAnswer;

  const _QuestionReview({
    required this.questionNumber,
    required this.question,
    this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrect = userAnswer == question.correctAnswerIndex;
    final wasAnswered = userAnswer != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryLight,
        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        border: Border.all(
          color: !wasAnswered
              ? AppTheme.textDark
              : isCorrect
              ? AppTheme.success
              : AppTheme.error,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question number and status
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: !wasAnswered
                      ? AppTheme.textDark
                      : isCorrect
                      ? AppTheme.success
                      : AppTheme.error,
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                ),
                child: Text(
                  'Q$questionNumber',
                  style: const TextStyle(
                    color: AppTheme.textLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                !wasAnswered
                    ? Icons.help_outline
                    : isCorrect
                    ? Icons.check_circle
                    : Icons.cancel,
                color: !wasAnswered
                    ? AppTheme.textDark
                    : isCorrect
                    ? AppTheme.success
                    : AppTheme.error,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Question text
          Text(
            question.question,
            style: const TextStyle(
              color: AppTheme.textLight,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          // Correct answer
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Correct: ',
                style: TextStyle(
                  color: AppTheme.success,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: Text(
                  question.options[question.correctAnswerIndex],
                  style: const TextStyle(
                    color: AppTheme.textLight,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),

          // User answer if wrong or not answered
          if (wasAnswered && !isCorrect) ...[
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your answer: ',
                  style: TextStyle(
                    color: AppTheme.error,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: Text(
                    question.options[userAnswer!],
                    style: const TextStyle(
                      color: AppTheme.textLight,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],

          if (!wasAnswered) ...[
            const SizedBox(height: 8),
            const Text(
              'Not answered',
              style: TextStyle(
                color: AppTheme.textDark,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],

          // Explanation
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryDark,
              borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: AppTheme.accentGold,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    question.explanation,
                    style: const TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
