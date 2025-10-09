import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import 'quiz_result_screen.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({super.key});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    final quizProvider = context.read<QuizProvider>();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (quizProvider.timeRemaining > 0) {
        quizProvider.updateTime(quizProvider.timeRemaining - 1);
      } else {
        _timer?.cancel();
        _submitQuiz();
      }
    });
  }

  void _submitQuiz() {
    final quizProvider = context.read<QuizProvider>();
    final authProvider = context.read<AuthProvider>();
    
    if (authProvider.currentUser != null) {
      // Check if already completed BEFORE submitting
      final wasAlreadyCompleted = quizProvider.isQuizCompleted(quizProvider.currentQuiz!.id);
      
      final result = quizProvider.submitQuiz(authProvider.currentUser!.id);
      
      if (result != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QuizResultScreen(
              result: result,
              wasAlreadyCompleted: wasAlreadyCompleted,
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<bool> _showExitDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.primaryMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        ),
        title: const Row(
          children: [
            Icon(Icons.warning, color: AppTheme.error, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'QUIT QUIZ?',
                style: TextStyle(
                  color: AppTheme.error,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
        content: const Text(
          'Are you sure you want to quit? Your progress will be lost and you won\'t earn any XP.',
          style: TextStyle(
            color: AppTheme.textLight,
            fontSize: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.error,
            ),
            child: const Text('QUIT'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final shouldPop = await _showExitDialog();
          if (shouldPop && mounted) {
            _timer?.cancel();
            final quizProvider = context.read<QuizProvider>();
            quizProvider.clearQuiz();
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<QuizProvider>(
            builder: (context, quizProvider, child) {
              final minutes = quizProvider.timeRemaining ~/ 60;
              final seconds = quizProvider.timeRemaining % 60;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      quizProvider.currentQuiz?.title.toUpperCase() ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: quizProvider.timeRemaining < 60
                          ? AppTheme.error
                          : AppTheme.accentGold,
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    ),
                    child: Text(
                      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: quizProvider.timeRemaining < 60
                            ? AppTheme.textLight
                            : AppTheme.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          leading: IconButton(
            icon: const Icon(Icons.close, color: AppTheme.textLight),
            onPressed: () async {
              final shouldQuit = await _showExitDialog();
              if (shouldQuit && mounted) {
                _timer?.cancel();
                final quizProvider = context.read<QuizProvider>();
                quizProvider.clearQuiz();
                Navigator.of(context).pop();
              }
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            final currentQuestion = quizProvider.currentQuestion;
            if (currentQuestion == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                // Progress bar
                Container(
                  height: 4,
                  color: AppTheme.primaryLight,
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: (quizProvider.currentQuestionIndex + 1) /
                        (quizProvider.currentQuiz?.questions.length ?? 1),
                    child: Container(color: AppTheme.accentGold),
                  ),
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question number
                        Text(
                          'QUESTION ${quizProvider.currentQuestionIndex + 1} OF ${quizProvider.currentQuiz?.questions.length}',
                          style: const TextStyle(
                            color: AppTheme.accentGold,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Question text
                        Text(
                          currentQuestion.question,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: AppTheme.textLight,
                            fontSize: 22,
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Answer options
                        ...List.generate(
                          currentQuestion.options.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _AnswerOption(
                              text: currentQuestion.options[index],
                              index: index,
                              isSelected: quizProvider.userAnswers[
                                  quizProvider.currentQuestionIndex] == index,
                              onTap: () {
                                quizProvider.answerQuestion(index);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Navigation buttons
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryMedium,
                    border: Border(
                      top: BorderSide(color: AppTheme.primaryLight, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (quizProvider.currentQuestionIndex > 0)
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: OutlinedButton(
                              onPressed: () {
                                quizProvider.previousQuestion();
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppTheme.textGray,
                                  width: 1,
                                ),
                                foregroundColor: AppTheme.textLight,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(AppTheme.sharpRadius),
                                  ),
                                ),
                              ),
                              child: const Text('PREV'),
                            ),
                          ),
                        ),
                      if (quizProvider.currentQuestionIndex > 0)
                        const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              if (quizProvider.isLastQuestion) {
                                _showSubmitDialog();
                              } else {
                                quizProvider.nextQuestion();
                              }
                            },
                            child: Text(
                              quizProvider.isLastQuestion ? 'SUBMIT QUIZ' : 'NEXT',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.primaryMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        ),
        title: const Text(
          'SUBMIT QUIZ?',
          style: TextStyle(
            color: AppTheme.accentGold,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
        content: const Text(
          'Are you sure you want to submit your answers? You won\'t be able to change them after submitting.',
          style: TextStyle(color: AppTheme.textLight),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _submitQuiz();
            },
            child: const Text('SUBMIT'),
          ),
        ],
      ),
    );
  }
}

class _AnswerOption extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _AnswerOption({
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentGold : AppTheme.primaryMedium,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
          border: Border.all(
            color: isSelected ? AppTheme.accentGold : AppTheme.primaryLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primaryDark : AppTheme.primaryLight,
                borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index), // A, B, C, D
                  style: TextStyle(
                    color: isSelected ? AppTheme.accentGold : AppTheme.textGray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? AppTheme.primaryDark : AppTheme.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
