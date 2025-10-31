import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../core/theme/app_theme.dart';
import '../core/widgets/casino_blob_background.dart';
import '../providers/auth_provider.dart';
import 'home/home_screen_content.dart';
import 'quiz/quiz_categories_screen.dart';
import 'wiki/wiki_screen.dart';
import 'settings/settings_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<String> _titles = [
    'HOME',
    'QUIZZES',
    'WIKI',
    'SETTINGS',
  ];

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenContent(onNavigateToQuizzes: () => _onNavigationTap(1)),
      const QuizCategoriesScreen(),
      const WikiScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavigationTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CasinoBlobBackground(
        child: Column(
          children: [
            // Blurred App Bar
            _buildBlurredAppBar(),
            
            // Screen Content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const PageScrollPhysics(), // Ensure proper page scrolling
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _screens,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBlurredAppBar() {
    return SafeArea(
      bottom: false,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.primaryDark.withOpacity(0.8),
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.accentGold.withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _titles[_currentIndex],
                      style: const TextStyle(
                        color: AppTheme.accentGold,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  if (_currentIndex == 2) // Wiki screen
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      ),
                      child: const Icon(
                        Icons.school,
                        color: AppTheme.accentGold,
                        size: 20,
                      ),
                    ),
                  if (_currentIndex == 0) // Home screen - show user level
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return Container(
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
                        );
                      },
                    ),
                ],
              ),
            ),
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
            onTap: _onNavigationTap,
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
                icon: Icon(Icons.settings),
                label: 'SETTINGS',
              ),
            ],
          ),
        ),
      ),
    );
  }
}