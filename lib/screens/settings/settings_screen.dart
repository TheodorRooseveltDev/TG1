import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quiz_provider.dart';
import '../auth/welcome_screen.dart';
import '../legal/terms_screen.dart';
import '../legal/privacy_policy_screen.dart';
import '../wiki/wiki_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;
  bool _notificationsEnabled = false;
  // bool _darkModeEnabled = true; // TODO: Implement dark mode feature
  double _soundVolume = 0.7;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _soundEnabled = prefs.getBool('soundEnabled') ?? true;
      _vibrationEnabled = prefs.getBool('vibrationEnabled') ?? true;
      _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? false;
      // _darkModeEnabled = prefs.getBool('darkModeEnabled') ?? true;
      _soundVolume = prefs.getDouble('soundVolume') ?? 0.7;
    });
  }

  Future<void> _saveSetting(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    }
  }

  Future<void> _resetProgress() async {
    final confirmed = await showDialog<bool>(
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
            Text(
              'RESET PROGRESS',
              style: TextStyle(
                color: AppTheme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: const Text(
          'Are you sure you want to reset all your progress? This action cannot be undone.',
          style: TextStyle(color: AppTheme.textGray, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'CANCEL',
              style: TextStyle(
                color: AppTheme.textGray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.error,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'RESET',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final authProvider = context.read<AuthProvider>();
      await authProvider.logout();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Progress reset successfully'),
            backgroundColor: AppTheme.success,
          ),
        );
      }
    }
  }

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.primaryMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        ),
        title: const Row(
          children: [
            Icon(Icons.logout, color: AppTheme.accentGold, size: 28),
            SizedBox(width: 12),
            Text(
              'LOG OUT',
              style: TextStyle(
                color: AppTheme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: const Text(
          'Are you sure you want to log out? Your progress will be saved.',
          style: TextStyle(color: AppTheme.textGray, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'CANCEL',
              style: TextStyle(
                color: AppTheme.textGray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentGold,
              foregroundColor: AppTheme.primaryDark,
            ),
            child: const Text(
              'LOG OUT',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final authProvider = context.read<AuthProvider>();
      await authProvider.logout();

      if (mounted) {
        // Navigate to welcome screen and remove all previous routes
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (route) => false,
        );
      }
    }
  }

  Future<void> _deleteProfile() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.primaryMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        ),
        title: const Row(
          children: [
            Icon(Icons.delete_forever, color: AppTheme.error, size: 28),
            SizedBox(width: 12),
            Text(
              'DELETE PROFILE',
              style: TextStyle(
                color: AppTheme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: const Text(
          'Are you sure you want to delete your profile? This will permanently delete all your data, progress, and settings. This action cannot be undone.',
          style: TextStyle(color: AppTheme.textGray, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'CANCEL',
              style: TextStyle(
                color: AppTheme.textGray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.error,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'DELETE',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final authProvider = context.read<AuthProvider>();
      await authProvider.deleteProfile();

      if (mounted) {
        // Navigate to welcome screen and remove all previous routes
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.primaryMedium,
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(color: AppTheme.primaryLight, width: 1),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppTheme.sharpRadius,
                        ),
                        border: Border.all(
                          color: AppTheme.accentGold,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 64,
                        color: AppTheme.accentGold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.username.toUpperCase() ?? 'GUEST',
                      style: const TextStyle(
                        color: AppTheme.accentGold,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Level ${user?.level ?? 1}',
                      style: const TextStyle(
                        color: AppTheme.textGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ProfileStat(
                          label: 'TOTAL XP',
                          value: '${user?.xp ?? 0}',
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: AppTheme.primaryLight,
                        ),
                        _ProfileStat(
                          label: 'TOTAL SCORE',
                          value: '${user?.totalScore ?? 0}',
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: AppTheme.primaryLight,
                        ),
                        _ProfileStat(
                          label: 'UNLOCKED',
                          value:
                              '${user?.unlockedQuizCount ?? 3}/${context.read<QuizProvider>().allQuizzes.length}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Audio Settings
              const Text(
                'AUDIO',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.volume_up,
                title: 'Sound Effects',
                subtitle: 'Play sound effects during quizzes',
                trailing: Switch(
                  value: _soundEnabled,
                  onChanged: (value) {
                    setState(() => _soundEnabled = value);
                    _saveSetting('soundEnabled', value);
                  },
                  activeColor: AppTheme.accentGold,
                ),
              ),

              if (_soundEnabled) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryMedium,
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                    border: Border.all(color: AppTheme.primaryLight, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Volume',
                            style: TextStyle(
                              color: AppTheme.textLight,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${(_soundVolume * 100).toInt()}%',
                            style: const TextStyle(
                              color: AppTheme.accentGold,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: AppTheme.accentGold,
                          inactiveTrackColor: AppTheme.primaryLight,
                          thumbColor: AppTheme.accentGold,
                          overlayColor: AppTheme.accentGold.withOpacity(0.2),
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: _soundVolume,
                          onChanged: (value) {
                            setState(() => _soundVolume = value);
                            _saveSetting('soundVolume', value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 32),

              // Haptics
              const Text(
                'HAPTICS',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.vibration,
                title: 'Vibration',
                subtitle: 'Vibrate on button taps and interactions',
                trailing: Switch(
                  value: _vibrationEnabled,
                  onChanged: (value) {
                    setState(() => _vibrationEnabled = value);
                    _saveSetting('vibrationEnabled', value);
                  },
                  activeColor: AppTheme.accentGold,
                ),
              ),

              const SizedBox(height: 32),

              // Notifications
              const Text(
                'NOTIFICATIONS',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.notifications,
                title: 'Push Notifications',
                subtitle: 'Receive reminders and updates',
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                    _saveSetting('notificationsEnabled', value);
                  },
                  activeColor: AppTheme.accentGold,
                ),
              ),

              const SizedBox(height: 32),

              // Data
              const Text(
                'DATA',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.restart_alt,
                title: 'Reset Progress',
                subtitle: 'Clear all quiz progress and start over',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.error,
                  size: 20,
                ),
                onTap: _resetProgress,
              ),

              const SizedBox(height: 32),

              // Account Actions
              const Text(
                'ACCOUNT',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.logout,
                title: 'Log Out',
                subtitle: 'Sign out of your account',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.accentGold,
                  size: 20,
                ),
                onTap: _logout,
              ),

              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.delete_forever,
                title: 'Delete Profile',
                subtitle: 'Permanently delete your account and all data',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.error,
                  size: 20,
                ),
                onTap: _deleteProfile,
              ),

              const SizedBox(height: 32),

              // Learning
              const Text(
                'LEARNING',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.school,
                title: 'Quiz Wiki',
                subtitle: 'Study all questions and answers',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.accentGold,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WikiScreen()),
                  );
                },
              ),

              const SizedBox(height: 32),

              // Legal
              const Text(
                'LEGAL',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.description,
                title: 'Terms & Conditions',
                subtitle: 'Read our terms of service',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.textGray,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              _SettingTile(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                subtitle: 'Learn how we protect your data',
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.textGray,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // App Info
              const Text(
                'APP INFO',
                style: TextStyle(
                  color: AppTheme.accentGold,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),

              // Educational Disclaimer
              Container(
                padding: const EdgeInsets.all(20),
                decoration: AppTheme.neonBorder(
                  color: AppTheme.disclaimerRed,
                  borderWidth: 2.0,
                  blurRadius: 12.0,
                  backgroundColor: AppTheme.primaryMedium,
                  radius: AppTheme.sharpRadius,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppTheme.disclaimerRed,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'IMPORTANT NOTICE',
                            style: TextStyle(
                              color: AppTheme.disclaimerRed,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This game is for educational purposes only and does not offer real money gambling or opportunities to win real money or prizes. It does not promote gambling but offers an insight into the dealer\'s career in an engaging way. Play safe and responsibly!',
                      style: TextStyle(
                        color: AppTheme.disclaimerRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryMedium,
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(color: AppTheme.primaryLight, width: 1),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Version',
                          style: TextStyle(
                            color: AppTheme.textGray,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '1.0.0',
                          style: const TextStyle(
                            color: AppTheme.textLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: AppTheme.primaryLight, height: 1),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Developer',
                          style: TextStyle(
                            color: AppTheme.textGray,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Casino Dealer Quiz',
                          style: const TextStyle(
                            color: AppTheme.textLight,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.primaryMedium,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
          border: Border.all(color: AppTheme.primaryLight, width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppTheme.textGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            trailing,
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppTheme.accentGold,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
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
    );
  }
}
