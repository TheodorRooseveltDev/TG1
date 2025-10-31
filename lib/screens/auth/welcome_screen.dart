import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/casino_blob_background.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _usernameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _handleStart() async {
    final username = _usernameController.text.trim();

    if (username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a username'),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    if (username.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username must be at least 3 characters'),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    final authProvider = context.read<AuthProvider>();
    await authProvider.register(
      '$username@casino.quiz', // Auto-generated email
      username, // Username
      'password123', // Default password (not used)
    );

    if (mounted) {
      setState(() => _isLoading = false);

      // Check if registration was successful
      if (authProvider.isAuthenticated) {
        // Navigate to home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else if (authProvider.errorMessage != null) {
        // Show error message if registration failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage!),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CasinoBlobBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),

                // Logo
                Image.asset(
                  'assets/logo.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 32),

                const Text(
                  'Test Your Knowledge',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textGray,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 60),

                // Username input
                TextField(
                  controller: _usernameController,
                  style: const TextStyle(
                    color: AppTheme.textLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter username',
                    hintStyle: TextStyle(
                      color: AppTheme.textGray.withOpacity(0.5),
                      fontSize: 16,
                    ),
                    filled: true,
                    fillColor: AppTheme.primaryMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      borderSide: const BorderSide(
                        color: AppTheme.accentGold,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      borderSide: BorderSide(
                        color: AppTheme.primaryLight,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      borderSide: const BorderSide(
                        color: AppTheme.accentGold,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    counterText: '',
                  ),
                  textCapitalization: TextCapitalization.words,
                  maxLength: 20,
                  onSubmitted: (_) => _handleStart(),
                ),

                const SizedBox(height: 20),

                // Start button
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleStart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentGold,
                      foregroundColor: AppTheme.primaryDark,
                      disabledBackgroundColor: AppTheme.textDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.sharpRadius,
                        ),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppTheme.primaryDark,
                              ),
                            ),
                          )
                        : const Text(
                            'START',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.0,
                            ),
                          ),
                  ),
                ),

                const Spacer(),

                // Bottom stats
                const Text(
                  '38 Quizzes • 7 Categories',
                  style: TextStyle(
                    color: AppTheme.textGray,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
