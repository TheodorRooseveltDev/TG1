import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/casino_blob_background.dart';
import '../../models/quiz.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../quiz/quiz_list_screen.dart';
import '../quiz/quiz_play_screen.dart';
import '../settings/settings_screen.dart';
import '../history/quiz_history_screen.dart';
import '../wiki/wiki_screen.dart';
import '../legal/terms_screen.dart';
import '../legal/privacy_policy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuizProvider>().loadQuizzes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppTheme.accentGold),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.school, color: AppTheme.accentGold),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WikiScreen()),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: CasinoBlobBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User welcome card
                Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    return Container(
                      width: double.infinity,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppTheme.accentGold.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.sharpRadius,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.casino,
                                  color: AppTheme.accentGold,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Welcome back',
                                      style: TextStyle(
                                        color: AppTheme.textGray,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      authProvider.currentUser?.username
                                              .toUpperCase() ??
                                          'PLAYER',
                                      style: const TextStyle(
                                        color: AppTheme.accentGold,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.5,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.accentGold,
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.sharpRadius,
                                  ),
                                ),
                                child: Text(
                                  'LVL ${authProvider.currentUser?.level ?? 1}',
                                  style: const TextStyle(
                                    color: AppTheme.primaryDark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // XP Bar
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'EXPERIENCE',
                                    style: TextStyle(
                                      color: AppTheme.textGray,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  Text(
                                    '${authProvider.currentUser?.xp ?? 0}/${authProvider.currentUser?.xpForNextLevel ?? 100} XP',
                                    style: const TextStyle(
                                      color: AppTheme.textLight,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  AppTheme.sharpRadius,
                                ),
                                child: LinearProgressIndicator(
                                  value:
                                      authProvider.currentUser?.xpPercentage ??
                                      0.0,
                                  backgroundColor: AppTheme.primaryDark,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                        AppTheme.accentGold,
                                      ),
                                  minHeight: 10,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Stats row
                          Row(
                            children: [
                              Expanded(
                                child: _SimpleStatCard(
                                  icon: Icons.emoji_events,
                                  label: 'SCORE',
                                  value:
                                      authProvider.currentUser?.totalScore
                                          .toString() ??
                                      '0',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SimpleStatCard(
                                  icon: Icons.check_circle,
                                  label: 'DONE',
                                  value:
                                      authProvider.currentUser?.quizzesCompleted
                                          .toString() ??
                                      '0',
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SimpleStatCard(
                                  icon: Icons.lock_open,
                                  label: 'UNLOCKED',
                                  value:
                                      '${authProvider.currentUser?.unlockedQuizCount ?? 3}',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Slot Machine Section
                const _SlotMachineQuiz(),

                const SizedBox(height: 24),

                // Categories header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'BROWSE CATEGORIES',
                      style: TextStyle(
                        color: AppTheme.accentGold,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Show all categories screen
                        _showAllCategories(context);
                      },
                      child: Row(
                        children: const [
                          Text(
                            'VIEW ALL',
                            style: TextStyle(
                              color: AppTheme.accentGold,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: AppTheme.accentGold,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Categories grid - Show only first 4
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: 4, // Only show first 4 categories
                  itemBuilder: (context, index) {
                    final category = QuizCategory.values[index];
                    return _CategoryCard(category: category);
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAllCategories(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: AppTheme.primaryDark,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppTheme.primaryMedium,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                  bottom: BorderSide(color: AppTheme.accentGold, width: 2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.casino,
                    color: AppTheme.accentGold,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'ALL CATEGORIES',
                      style: TextStyle(
                        color: AppTheme.accentGold,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppTheme.textLight),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            // All categories grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final quizProvider = context.watch<QuizProvider>();
    final user = authProvider.currentUser;

    return Drawer(
      backgroundColor: AppTheme.primaryDark,
      child: SafeArea(
        child: Column(
          children: [
            // Header with user info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryMedium,
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.accentGold.withOpacity(0.3),
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                children: [
                  // User Avatar
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppTheme.accentGold.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      border: Border.all(color: AppTheme.accentGold, width: 3),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 48,
                      color: AppTheme.accentGold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Username
                  Text(
                    user?.username.toUpperCase() ?? 'GUEST',
                    style: const TextStyle(
                      color: AppTheme.accentGold,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Level badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.accentGold,
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.stars,
                          size: 16,
                          color: AppTheme.primaryDark,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'LEVEL ${user?.level ?? 1}',
                          style: const TextStyle(
                            color: AppTheme.primaryDark,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('XP', '${user?.xp ?? 0}'),
                      Container(
                        width: 1,
                        height: 30,
                        color: AppTheme.primaryLight,
                      ),
                      _buildStatItem('SCORE', '${user?.totalScore ?? 0}'),
                      Container(
                        width: 1,
                        height: 30,
                        color: AppTheme.primaryLight,
                      ),
                      _buildStatItem(
                        'QUIZZES',
                        '${user?.unlockedQuizCount ?? 3}/${quizProvider.allQuizzes.length}',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.school,
                    title: 'Quiz Wiki',
                    subtitle: 'Study questions & answers',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WikiScreen(),
                        ),
                      );
                    },
                  ),

                  _buildDrawerItem(
                    context,
                    icon: Icons.history,
                    title: 'Quiz History',
                    subtitle: 'View past results',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizHistoryScreen(),
                        ),
                      );
                    },
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Divider(color: AppTheme.primaryLight, height: 1),
                  ),

                  _buildDrawerItem(
                    context,
                    icon: Icons.settings,
                    title: 'Settings',
                    subtitle: 'App preferences',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),

                  _buildDrawerItem(
                    context,
                    icon: Icons.description,
                    title: 'Terms & Conditions',
                    subtitle: 'Legal information',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsScreen(),
                        ),
                      );
                    },
                  ),

                  _buildDrawerItem(
                    context,
                    icon: Icons.privacy_tip,
                    title: 'Privacy Policy',
                    subtitle: 'How we protect your data',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Footer with version
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppTheme.primaryLight, width: 1),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.casino,
                        color: AppTheme.accentGold,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'CASINO ACADEMY PRO',
                        style: TextStyle(
                          color: AppTheme.textGray,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: AppTheme.textGray.withOpacity(0.6),
                      fontSize: 10,
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

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppTheme.accentGold,
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: AppTheme.textGray,
            fontSize: 9,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.accentGold.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
              ),
              child: Icon(icon, color: AppTheme.accentGold, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppTheme.textLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppTheme.textGray, fontSize: 11),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.textGray,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SimpleStatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.primaryDark,
        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.accentGold, size: 20),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textLight,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textGray,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
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
          border: Border.all(color: AppTheme.primaryLight, width: 1),
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

class _SlotMachineQuiz extends StatefulWidget {
  const _SlotMachineQuiz();

  @override
  State<_SlotMachineQuiz> createState() => _SlotMachineQuizState();
}

class _SlotMachineQuizState extends State<_SlotMachineQuiz> {
  bool _isSpinning = false;
  List<QuizCategory> _currentCategories = [];
  List<QuizCategory> _targetCategories = [];

  @override
  void initState() {
    super.initState();
    _initializeSlots();
  }

  void _initializeSlots() {
    // Show first 3 categories initially
    _currentCategories = [
      QuizCategory.dealerBasics,
      QuizCategory.cardHandling,
      QuizCategory.chipManagement,
    ];
    _targetCategories = List.from(_currentCategories);
  }

  void _spinSlots() async {
    if (_isSpinning) return;

    // Select categories before spinning
    final selectedCats = _getRandomCategories();

    setState(() {
      _isSpinning = true;
      _targetCategories = selectedCats; // Set target for animation
    });

    // Wait for animation to complete (spinning)
    await Future.delayed(const Duration(milliseconds: 2500));

    if (mounted) {
      // Don't update _currentCategories here - let the animation finish naturally
      // Just pause to let user see the result with yellow border
      await Future.delayed(const Duration(milliseconds: 500));

      // Show modal with smooth animation
      if (mounted) {
        await _showQuizModal();

        // After modal closes, update current to target and remove yellow border
        if (mounted) {
          setState(() {
            _currentCategories = List.from(_targetCategories);
            _isSpinning = false;
          });
        }
      }
    }
  }

  List<QuizCategory> _getRandomCategories() {
    final allCategories = List<QuizCategory>.from(QuizCategory.values);
    allCategories.shuffle();
    return allCategories.take(3).toList();
  }

  Future<void> _showQuizModal() async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              color: AppTheme.primaryMedium,
              borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
              border: Border.all(color: AppTheme.accentGold, width: 2),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppTheme.sharpRadius - 2),
                      topRight: Radius.circular(AppTheme.sharpRadius - 2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.accentGold.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(
                            AppTheme.sharpRadius,
                          ),
                        ),
                        child: const Icon(
                          Icons.casino,
                          color: AppTheme.accentGold,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'QUICK MIX QUIZ',
                              style: TextStyle(
                                color: AppTheme.accentGold,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${_getTotalQuestions()} Questions Ready',
                              style: const TextStyle(
                                color: AppTheme.textGray,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Content (scrollable)
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'SELECTED CATEGORIES',
                            style: TextStyle(
                              color: AppTheme.textGray,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Categories list
                          ..._targetCategories.asMap().entries.map((entry) {
                            final index = entry.key;
                            final category = entry.value;
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: index < _targetCategories.length - 1
                                    ? 12
                                    : 0,
                              ),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryLight,
                                borderRadius: BorderRadius.circular(
                                  AppTheme.sharpRadius,
                                ),
                                border: Border.all(
                                  color: AppTheme.primaryDark,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppTheme.accentGold.withOpacity(
                                        0.15,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppTheme.sharpRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        _getCategoryIcon(category),
                                        color: AppTheme.accentGold,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.title,
                                          style: const TextStyle(
                                            color: AppTheme.textLight,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          category.description,
                                          style: const TextStyle(
                                            color: AppTheme.textGray,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),

                          const SizedBox(height: 20),

                          // Info box
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppTheme.accentGold.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                AppTheme.sharpRadius,
                              ),
                              border: Border.all(
                                color: AppTheme.accentGold.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.lightbulb_outline,
                                  color: AppTheme.accentGold,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Questions will be shuffled from all selected categories',
                                    style: const TextStyle(
                                      color: AppTheme.textLight,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Actions
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppTheme.primaryLight, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            side: const BorderSide(
                              color: AppTheme.textGray,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppTheme.sharpRadius,
                              ),
                            ),
                          ),
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              color: AppTheme.textGray,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _startMixedQuiz();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppTheme.accentGold,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppTheme.sharpRadius,
                                ),
                              ),
                            ),
                            child: const Text(
                              'START',
                              style: TextStyle(
                                color: AppTheme.primaryDark,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(QuizCategory category) {
    switch (category) {
      case QuizCategory.dealerBasics:
        return Icons.style;
      case QuizCategory.cardHandling:
        return Icons.casino;
      case QuizCategory.chipManagement:
        return Icons.album;
      case QuizCategory.customerService:
        return Icons.view_module;
      case QuizCategory.gameRules:
        return Icons.credit_card;
      case QuizCategory.casinoProtocol:
        return Icons.casino_outlined;
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

  int _getTotalQuestions() {
    final quizProvider = context.read<QuizProvider>();
    int total = 0;
    for (var category in _targetCategories) {
      final quizzes = quizProvider.getQuizzesByCategory(category);
      if (quizzes.isNotEmpty) {
        total += quizzes.first.questions.length;
      }
    }
    return total;
  }

  void _startMixedQuiz() {
    final quizProvider = context.read<QuizProvider>();

    // Collect questions from selected categories
    List<Question> mixedQuestions = [];
    for (var category in _targetCategories) {
      final quizzes = quizProvider.getQuizzesByCategory(category);
      if (quizzes.isNotEmpty) {
        mixedQuestions.addAll(quizzes.first.questions);
      }
    }

    // Shuffle questions for variety
    mixedQuestions.shuffle();

    // Create a mixed quiz
    final mixedQuiz = Quiz(
      id: 'mixed_${DateTime.now().millisecondsSinceEpoch}',
      title: 'Quick Mix Quiz',
      category: QuizCategory.general,
      questions: mixedQuestions,
      timeLimit: mixedQuestions.length * 60, // 1 minute per question
      passingScore: 70,
    );

    // Start the quiz
    quizProvider.startQuiz(mixedQuiz);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizPlayScreen()),
    ).then((_) {
      // Reset slots after returning from quiz
      if (mounted) {
        _initializeSlots();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.primaryMedium,
        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        border: Border.all(color: AppTheme.accentGold, width: 2),
      ),
      child: Column(
        children: [
          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.casino, color: AppTheme.accentGold, size: 28),
              const SizedBox(width: 12),
              Text(
                'QUICK MIX QUIZ',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppTheme.accentGold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Text(
            'Spin the slots to get a random mix!',
            style: TextStyle(color: AppTheme.textGray, fontSize: 13),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Slot Machine Display
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryDark,
              borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return Expanded(
                  child: _SlotReel(
                    currentCategory: _currentCategories[index],
                    targetCategory: _targetCategories[index],
                    isSpinning: _isSpinning,
                    delay: index * 200,
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 24),

          // Spin Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _isSpinning ? null : _spinSlots,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isSpinning
                    ? AppTheme.textDark
                    : AppTheme.accentGold,
              ),
              child: _isSpinning
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryDark,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text('SPINNING...'),
                      ],
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.casino, size: 24),
                        SizedBox(width: 12),
                        Text('SPIN & START'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlotReel extends StatefulWidget {
  final QuizCategory currentCategory;
  final QuizCategory targetCategory;
  final bool isSpinning;
  final int delay;

  const _SlotReel({
    required this.currentCategory,
    required this.targetCategory,
    required this.isSpinning,
    required this.delay,
  });

  @override
  State<_SlotReel> createState() => _SlotReelState();
}

class _SlotReelState extends State<_SlotReel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _endValue;

  @override
  void initState() {
    super.initState();
    _calculateEndValue();

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000 + widget.delay),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: _endValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _calculateEndValue() {
    // Calculate how many steps needed to go from current to target
    final currentIndex = QuizCategory.values.indexOf(widget.currentCategory);
    final targetIndex = QuizCategory.values.indexOf(widget.targetCategory);
    final totalCategories = QuizCategory.values.length;

    // Calculate the distance forward to reach target
    int stepsToTarget = (targetIndex - currentIndex) % totalCategories;
    if (stepsToTarget < 0) stepsToTarget += totalCategories;

    // Add at least 2 full rotations (14 steps) for visual effect + the steps to target
    _endValue = (2 * totalCategories) + stepsToTarget.toDouble();
  }

  @override
  void didUpdateWidget(_SlotReel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSpinning && !oldWidget.isSpinning) {
      _calculateEndValue();
      _animation = Tween<double>(
        begin: 0,
        end: _endValue,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getCategoryIcon(QuizCategory category) {
    switch (category) {
      case QuizCategory.dealerBasics:
        return Icons.style;
      case QuizCategory.cardHandling:
        return Icons.casino;
      case QuizCategory.chipManagement:
        return Icons.album;
      case QuizCategory.customerService:
        return Icons.view_module;
      case QuizCategory.gameRules:
        return Icons.credit_card;
      case QuizCategory.casinoProtocol:
        return Icons.casino_outlined;
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 120,
      decoration: BoxDecoration(
        color: AppTheme.primaryMedium,
        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        border: Border.all(
          color: widget.isSpinning
              ? AppTheme.accentGold
              : AppTheme.primaryLight,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        child: widget.isSpinning
            ? AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  // Calculate animation: start from currentCategory, spin through all, land on targetCategory
                  final currentIndex = QuizCategory.values.indexOf(
                    widget.currentCategory,
                  );
                  final totalCategories = QuizCategory.values.length;

                  // Current display index: start from current, add animation progress
                  final displayValue = currentIndex + _animation.value;
                  final currentDisplayIndex =
                      displayValue.floor() % totalCategories;
                  final offset = (displayValue % 1) * 120;

                  return Stack(
                    children: [
                      // Current icon scrolling out
                      Positioned(
                        top: -offset,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          alignment: Alignment.center,
                          child: Icon(
                            _getCategoryIcon(
                              QuizCategory.values[currentDisplayIndex],
                            ),
                            size: 60,
                            color: AppTheme.accentGold,
                          ),
                        ),
                      ),
                      // Next icon scrolling in
                      Positioned(
                        top: 120 - offset,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          alignment: Alignment.center,
                          child: Icon(
                            _getCategoryIcon(
                              QuizCategory.values[(currentDisplayIndex + 1) %
                                  totalCategories],
                            ),
                            size: 60,
                            color: AppTheme.accentGold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            : Center(
                child: Icon(
                  _getCategoryIcon(widget.targetCategory),
                  size: 60,
                  color: AppTheme.accentGold,
                ),
              ),
      ),
    );
  }
}
