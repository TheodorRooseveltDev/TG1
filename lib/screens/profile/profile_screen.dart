import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final user = authProvider.currentUser;
          if (user == null) {
            return const Center(child: Text('No user data'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Profile header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryMedium,
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  ),
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppTheme.accentGold,
                          borderRadius: BorderRadius.circular(
                            AppTheme.sharpRadius,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            user.username.substring(0, 1).toUpperCase(),
                            style: const TextStyle(
                              color: AppTheme.primaryDark,
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Username
                      Text(
                        user.username.toUpperCase(),
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(color: AppTheme.accentGold),
                      ),

                      const SizedBox(height: 8),

                      // Email
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Statistics
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryMedium,
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'STATISTICS',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.accentGold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _StatRow(
                        icon: Icons.military_tech,
                        label: 'Level',
                        value: user.level.toString(),
                      ),
                      const SizedBox(height: 16),
                      _StatRow(
                        icon: Icons.stars_rounded,
                        label: 'Total XP',
                        value: '${user.xp} XP',
                      ),
                      const SizedBox(height: 16),
                      _StatRow(
                        icon: Icons.lock_open,
                        label: 'Unlocked Quizzes',
                        value: '${user.unlockedQuizCount} quizzes',
                      ),
                      const SizedBox(height: 16),
                      _StatRow(
                        icon: Icons.stars,
                        label: 'Total Score',
                        value: user.totalScore.toString(),
                      ),
                      const SizedBox(height: 16),
                      _StatRow(
                        icon: Icons.check_circle,
                        label: 'Quizzes Completed',
                        value: user.quizzesCompleted.toString(),
                      ),
                      const SizedBox(height: 16),
                      _StatRow(
                        icon: Icons.emoji_events,
                        label: 'Average Score',
                        value: user.quizzesCompleted > 0
                            ? '${(user.totalScore / user.quizzesCompleted).toStringAsFixed(1)}%'
                            : 'N/A',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Account settings
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryMedium,
                    borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ACCOUNT',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.accentGold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _SettingItem(
                        icon: Icons.person,
                        label: 'Edit Profile',
                        onTap: () {
                          // TODO: Implement edit profile
                        },
                      ),
                      const SizedBox(height: 16),
                      _SettingItem(
                        icon: Icons.history,
                        label: 'Quiz History',
                        onTap: () {
                          // TODO: Implement quiz history
                        },
                      ),
                      const SizedBox(height: 16),
                      _SettingItem(
                        icon: Icons.notifications,
                        label: 'Notifications',
                        onTap: () {
                          // TODO: Implement notifications settings
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Logout button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () async {
                      await authProvider.logout();
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.error,
                    ),
                    child: const Text('LOGOUT'),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.primaryLight,
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
                label,
                style: const TextStyle(
                  color: AppTheme.textGray,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.textLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SettingItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.primaryLight,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.accentGold, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppTheme.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
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
