import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../models/quiz.dart';
import '../../providers/quiz_provider.dart';

class WikiScreen extends StatefulWidget {
  const WikiScreen({super.key});

  @override
  State<WikiScreen> createState() => _WikiScreenState();
}

class _WikiScreenState extends State<WikiScreen> {
  String? _selectedCategory;
  String? _expandedQuizId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuizProvider>().loadQuizzes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizProvider>();
    final allQuizzes = quizProvider.allQuizzes;

    // Get unique categories
    final categories = allQuizzes
        .map((q) => q.category)
        .toSet()
        .toList()
      ..sort((a, b) => a.toString().compareTo(b.toString()));

    // Filter quizzes by selected category
    final filteredQuizzes = _selectedCategory == null
        ? allQuizzes
        : allQuizzes.where((q) => q.category.toString() == _selectedCategory).toList();

    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 120.0),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppTheme.primaryMedium,
                border: Border(
                  bottom: BorderSide(color: AppTheme.primaryLight, width: 1),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.accentGold.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                        ),
                        child: const Icon(
                          Icons.school,
                          color: AppTheme.accentGold,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LEARN & STUDY',
                              style: TextStyle(
                                color: AppTheme.accentGold,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'All quiz questions and answers',
                              style: TextStyle(
                                color: AppTheme.textGray,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Category Filter
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryChip('ALL', null),
                        ...categories.map((category) {
                          final categoryName = category.toString().split('.').last;
                          return _buildCategoryChip(categoryName, category.toString());
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Quiz List
            filteredQuizzes.isEmpty
                ? Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: const Text(
                      'NO QUIZZES FOUND',
                      style: TextStyle(
                        color: AppTheme.textGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Column(
                    children: filteredQuizzes.map((quiz) {
                      final isExpanded = _expandedQuizId == quiz.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _buildQuizCard(quiz, isExpanded),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String? categoryValue) {
    final isSelected = _selectedCategory == categoryValue;
    
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedCategory = categoryValue;
            _expandedQuizId = null; // Collapse all when switching categories
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.accentGold : AppTheme.primaryDark,
            borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
            border: Border.all(
              color: isSelected ? AppTheme.accentGold : AppTheme.primaryLight,
              width: 1,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.primaryDark : AppTheme.textLight,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCard(Quiz quiz, bool isExpanded) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryMedium,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
          border: Border.all(
            color: isExpanded ? AppTheme.accentGold : AppTheme.primaryLight,
            width: isExpanded ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            // Quiz Header
            InkWell(
              onTap: () {
                setState(() {
                  _expandedQuizId = isExpanded ? null : quiz.id;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      ),
                      child: const Icon(
                        Icons.quiz,
                        color: AppTheme.accentGold,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quiz.title.toUpperCase(),
                            style: const TextStyle(
                              color: AppTheme.accentGold,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.help_outline,
                                size: 14,
                                color: AppTheme.textGray,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${quiz.questions.length} Questions',
                                style: const TextStyle(
                                  color: AppTheme.textGray,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.emoji_events,
                                size: 14,
                                color: AppTheme.textGray,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${quiz.totalPoints} Points',
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
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: AppTheme.accentGold,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),

            // Quiz Questions (Expandable)
            if (isExpanded) ...[
              const Divider(color: AppTheme.primaryLight, height: 1),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Questions List
                    ...quiz.questions.asMap().entries.map((entry) {
                      final index = entry.key;
                      final question = entry.value;
                      return _buildQuestionCard(index + 1, question);
                    }),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(int questionNumber, Question question) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.primaryDark,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
          border: Border.all(
            color: AppTheme.primaryLight,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.accentGold,
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  ),
                  child: Text(
                    'Q$questionNumber',
                    style: const TextStyle(
                      color: AppTheme.primaryDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    question.question,
                    style: const TextStyle(
                      color: AppTheme.textLight,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.accentGold.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.stars,
                        size: 12,
                        color: AppTheme.accentGold,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${question.points}',
                        style: const TextStyle(
                          color: AppTheme.accentGold,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Answer Options
            ...question.options.asMap().entries.map((entry) {
              final optionIndex = entry.key;
              final option = entry.value;
              final isCorrect = optionIndex == question.correctAnswerIndex;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? AppTheme.success.withOpacity(0.1)
                        : AppTheme.primaryMedium,
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    border: Border.all(
                      color: isCorrect ? AppTheme.success : AppTheme.primaryLight,
                      width: isCorrect ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: isCorrect ? AppTheme.success : AppTheme.primaryDark,
                          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                        ),
                        child: Center(
                          child: isCorrect
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                )
                              : Text(
                                  String.fromCharCode(65 + optionIndex), // A, B, C, D
                                  style: const TextStyle(
                                    color: AppTheme.textGray,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            color: isCorrect ? AppTheme.success : AppTheme.textLight,
                            fontSize: 13,
                            fontWeight: isCorrect ? FontWeight.w600 : FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ),
                      if (isCorrect)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.success,
                            borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                          ),
                          child: const Text(
                            'CORRECT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),

            // Explanation (if available)
            if (question.explanation.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.accentGold.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(
                    color: AppTheme.accentGold.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: AppTheme.accentGold,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'EXPLANATION',
                            style: TextStyle(
                              color: AppTheme.accentGold,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            question.explanation,
                            style: const TextStyle(
                              color: AppTheme.textLight,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
