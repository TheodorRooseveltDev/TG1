import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRIVACY POLICY'),
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
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryMedium,
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(
                    color: AppTheme.accentGold.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.accentGold.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                      ),
                      child: const Icon(
                        Icons.privacy_tip,
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
                            'YOUR PRIVACY MATTERS',
                            style: TextStyle(
                              color: AppTheme.accentGold,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Last Updated: October 2025',
                            style: TextStyle(
                              color: AppTheme.textGray,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              _buildSection(
                '1. INTRODUCTION',
                'Casino Quiz Pro ("we", "our", "us") respects your privacy and is committed to protecting your personal data. This privacy policy will inform you about how we handle your personal data when you use our app.',
              ),

              _buildSection(
                '2. DATA WE COLLECT',
                'We collect and process the following data:\n\n• Username (chosen by you)\n• Quiz scores and progress\n• App usage statistics\n• Device information (OS version, device type)\n• App settings and preferences',
              ),

              _buildSection(
                '3. HOW WE USE YOUR DATA',
                'We use your data to:\n\n• Provide and maintain the App functionality\n• Track your quiz progress and achievements\n• Save your preferences and settings\n• Improve user experience\n• Analyze app performance and fix bugs',
              ),

              _buildSection(
                '4. DATA STORAGE',
                'Your data is stored locally on your device using:\n\n• Secure Storage: For authentication tokens\n• Shared Preferences: For app settings and user progress\n\nWe do not store your personal data on external servers. All data remains on your device.',
              ),

              _buildSection(
                '5. DATA SHARING',
                'We do NOT share your personal data with third parties. Your quiz scores, progress, and username remain private and are only stored locally on your device.',
              ),

              _buildSection(
                '6. THIRD-PARTY SERVICES',
                'Our app does not currently integrate with any third-party services that collect user data. We do not use analytics, advertising, or tracking services.',
              ),

              _buildSection(
                '7. CHILDREN\'S PRIVACY',
                'Our app is intended for users aged 18 and over. We do not knowingly collect data from children under 18. If you believe we have collected data from a child, please contact us immediately.',
              ),

              _buildSection(
                '8. YOUR DATA RIGHTS',
                'You have the right to:\n\n• Access your personal data\n• Correct inaccurate data\n• Delete your data (via "Reset Progress" in Settings)\n• Export your quiz history\n• Withdraw consent at any time',
              ),

              _buildSection(
                '9. DATA SECURITY',
                'We implement appropriate security measures to protect your data:\n\n• Secure encrypted storage for sensitive data\n• Local-only data storage (no cloud sync)\n• No third-party access to your information',
              ),

              _buildSection(
                '10. DATA RETENTION',
                'Your data is retained on your device until:\n\n• You delete the app\n• You use "Reset Progress" feature\n• You clear app data from device settings\n\nWe do not have access to or control over your locally stored data.',
              ),

              _buildSection(
                '11. COOKIES AND TRACKING',
                'Our app does not use cookies, web beacons, or any tracking technologies. We do not track your behavior across other apps or websites.',
              ),

              _buildSection(
                '12. CHANGES TO THIS POLICY',
                'We may update this Privacy Policy from time to time. We will notify you of any changes by updating the "Last Updated" date. Continued use of the app after changes constitutes acceptance of the new policy.',
              ),

              _buildSection(
                '13. INTERNATIONAL USERS',
                'As all data is stored locally on your device, there are no international data transfers. Your data remains in your jurisdiction.',
              ),

              _buildSection(
                '14. CONTACT US',
                'If you have questions about this Privacy Policy or our data practices, please contact us at:\n\nEmail: privacy@casinoquizpro.com\nSubject: Privacy Policy Inquiry',
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(
                    color: AppTheme.success,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.verified_user,
                      color: AppTheme.success,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'PRIVACY COMMITMENT',
                      style: TextStyle(
                        color: AppTheme.success,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your data stays on your device. We don\'t collect, share, or sell your personal information. Your privacy is our priority.',
                      style: TextStyle(
                        color: AppTheme.textLight,
                        fontSize: 12,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryMedium,
                  borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
                  border: Border.all(
                    color: AppTheme.primaryLight,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppTheme.accentGold,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'This app operates entirely offline. No data leaves your device.',
                        style: TextStyle(
                          color: AppTheme.textGray,
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
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

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.primaryMedium,
          borderRadius: BorderRadius.circular(AppTheme.sharpRadius),
          border: Border.all(
            color: AppTheme.primaryLight,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppTheme.accentGold,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: const TextStyle(
                color: AppTheme.textLight,
                fontSize: 13,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
