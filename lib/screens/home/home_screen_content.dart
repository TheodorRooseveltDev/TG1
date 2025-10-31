import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../../services/quiz_service.dart';
import '../quiz/quiz_detail_screen.dart';

class HomeScreenContent extends StatefulWidget {
  final VoidCallback? onNavigateToQuizzes;
  
  const HomeScreenContent({super.key, this.onNavigateToQuizzes});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final quizProvider = context.read<QuizProvider>();
      quizProvider.loadQuizzes();
      // Force a rebuild after loading
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cleaner user welcome card
                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryMedium,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.accentGold.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppTheme.accentGold.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.casino,
                                  color: AppTheme.accentGold,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome back, ${authProvider.currentUser?.username.toUpperCase() ?? 'PLAYER'}',
                                      style: const TextStyle(
                                        color: AppTheme.textLight,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Level ${authProvider.currentUser?.level ?? 1} • ${authProvider.currentUser?.xp ?? 0} XP',
                                      style: const TextStyle(
                                        color: AppTheme.textGray,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // XP Progress
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: authProvider.currentUser?.xpPercentage ?? 0.0,
                              backgroundColor: AppTheme.primaryDark,
                              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentGold),
                              minHeight: 8,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 20),

                // Recent Activity Section (Top Center)
                _buildRecentActivity(),

                const SizedBox(height: 20),

                // Quick Quiz Button (Center Feature)
                _buildQuickQuizButton(),

                const SizedBox(height: 20),
              ],
            ),
          ),
          
          // Fade overlay - ignore pointer events so it doesn't block taps
          IgnorePointer(
            child: AnimatedOpacity(
              opacity: (_scrollOffset > 50) ? 0.2 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.2],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickQuizButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.accentGold,
            AppTheme.accentGold.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentGold.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          _startQuickQuiz();
        },
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.flash_on,
                      color: AppTheme.primaryDark,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'QUICK QUIZ',
                    style: TextStyle(
                      color: AppTheme.primaryDark,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Random questions from all categories',
                style: TextStyle(
                  color: AppTheme.primaryDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        final recentResults = quizProvider.userResults.take(3).toList();
        
        if (recentResults.isEmpty) {
          return Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryMedium,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.primaryLight,
                  width: 1,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    color: AppTheme.textGray,
                    size: 32,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'No recent activity',
                    style: TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Complete your first quiz to see it here',
                    style: TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RECENT ACTIVITY',
              style: TextStyle(
                color: AppTheme.textLight,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            ...recentResults.map((result) => _buildRecentActivityItem(result, quizProvider)),
          ],
        );
      },
    );
  }

  Widget _buildRecentActivityItem(result, QuizProvider quizProvider) {
    final quiz = quizProvider.getQuizById(result.quizId);
    if (quiz == null) return const SizedBox.shrink();

    final passed = result.isPassed(quiz.passingScore);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.primaryMedium,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: passed 
              ? AppTheme.accentGold.withOpacity(0.3)
              : AppTheme.textGray.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: passed 
                  ? AppTheme.accentGold.withOpacity(0.2)
                  : AppTheme.textGray.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              passed ? Icons.check_circle : Icons.cancel,
              color: passed ? AppTheme.accentGold : AppTheme.textGray,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quiz.title,
                  style: const TextStyle(
                    color: AppTheme.textLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${result.percentage.toStringAsFixed(0)}% • ${result.correctAnswers}/${result.totalQuestions}',
                  style: const TextStyle(
                    color: AppTheme.textGray,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${result.score} pts',
            style: const TextStyle(
              color: AppTheme.accentGold,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void _startQuickQuiz() {
    try {
      final quizProvider = context.read<QuizProvider>();
      
      // Try provider first
      var allQuizzes = quizProvider.allQuizzes;
      
      // If provider has no quizzes, try loading directly from service
      if (allQuizzes.isEmpty) {
        quizProvider.loadQuizzes();
        allQuizzes = quizProvider.allQuizzes;
        
        // If still empty, use QuizService directly as fallback
        if (allQuizzes.isEmpty) {
          final quizService = QuizService();
          allQuizzes = quizService.getAllQuizzes();
        }
      }
      
      if (allQuizzes.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No quizzes available. Please check the app configuration.'),
            backgroundColor: AppTheme.error,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }
      
      // Select and navigate to random quiz
      final randomIndex = Random().nextInt(allQuizzes.length);
      final randomQuiz = allQuizzes[randomIndex];
      
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => QuizDetailScreen(quiz: randomQuiz),
        ),
      );
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error starting quiz: $e'),
          backgroundColor: AppTheme.error,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }


}


