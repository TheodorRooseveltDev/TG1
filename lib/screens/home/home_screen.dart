import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/casino_blob_background.dart';
import '../../models/quiz.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../quiz/quiz_list_screen.dart';
import '../settings/settings_screen.dart';
import '../history/quiz_history_screen.dart';
import '../wiki/wiki_screen.dart';
import '../legal/terms_screen.dart';
import '../legal/privacy_policy_screen.dart';

// This file is deprecated - use MainNavigation instead
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;
  int _currentIndex = 0;

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
      context.read<QuizProvider>().loadQuizzes();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                MaterialPageRoute(
                  builder: (context) => const WikiScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: CasinoBlobBackground(
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
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
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
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
                                borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
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
                                    authProvider.currentUser?.username.toUpperCase() ?? 'PLAYER',
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
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppTheme.accentGold,
                                borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                              child: LinearProgressIndicator(
                                value: authProvider.currentUser?.xpPercentage ?? 0.0,
                                backgroundColor: AppTheme.primaryDark,
                                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.accentGold),
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
                                value: authProvider.currentUser?.totalScore.toString() ?? '0',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _SimpleStatCard(
                                icon: Icons.check_circle,
                                label: 'DONE',
                                value: authProvider.currentUser?.quizzesCompleted.toString() ?? '0',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _SimpleStatCard(
                                icon: Icons.lock_open,
                                label: 'UNLOCKED',
                                value: '${authProvider.currentUser?.unlockedQuizCount ?? 3}',
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
        
        // Fade overlay that appears when scrolling
        AnimatedOpacity(
          opacity: (_scrollOffset > 50) ? 0.3 : 0.0,
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
                stops: [0.0, 0.3],
              ),
            ),
          ),
        ),
      ],
    ),
      ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.primaryDark.withOpacity(0.8),
            border: Border(
              top: BorderSide(
                color: AppTheme.accentGold.withOpacity(0.3),
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              _handleNavigationTap(index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppTheme.accentGold,
            unselectedItemColor: AppTheme.textGray,
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.quiz),
                label: 'QUIZZES',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'WIKI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'HISTORY',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'SETTINGS',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNavigationTap(int index) {
    switch (index) {
      case 0:
        // Already on home, maybe scroll to top
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
        break;
      case 1:
        // Navigate to all categories
        _showAllCategories(context);
        break;
      case 2:
        // Navigate to Wiki
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WikiScreen(),
          ),
        );
        break;
      case 3:
        // Navigate to History
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizHistoryScreen(),
          ),
        );
        break;
      case 4:
        // Navigate to Settings
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingsScreen(),
          ),
        );
        break;
    }
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
                  bottom: BorderSide(
                    color: AppTheme.accentGold,
                    width: 2,
                  ),
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
                      border: Border.all(
                        color: AppTheme.accentGold,
                        width: 3,
                      ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                      _buildStatItem('QUIZZES', '${user?.unlockedQuizCount ?? 3}/${quizProvider.allQuizzes.length}'),
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
                  top: BorderSide(
                    color: AppTheme.primaryLight,
                    width: 1,
                  ),
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
              child: Icon(
                icon,
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
                    style: TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 11,
                    ),
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
