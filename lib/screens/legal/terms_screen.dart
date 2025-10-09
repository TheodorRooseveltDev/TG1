import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TERMS & CONDITIONS'),
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
                        Icons.description,
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
                            'LEGAL AGREEMENT',
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
                '1. ACCEPTANCE OF TERMS',
                'By accessing and using Casino Quiz Pro ("the App"), you accept and agree to be bound by the terms and provisions of this agreement. If you do not agree to these terms, please do not use the App.',
              ),

              _buildSection(
                '2. USE LICENSE',
                'Permission is granted to use the App for personal, non-commercial purposes. This license shall automatically terminate if you violate any of these restrictions and may be terminated by Casino Quiz Pro at any time.',
              ),

              _buildSection(
                '3. EDUCATIONAL PURPOSE',
                'This app is designed for educational and entertainment purposes only. The quizzes and content provided are meant to test and improve your knowledge about casino games. This app does not involve real money gambling or betting.',
              ),

              _buildSection(
                '4. USER ACCOUNTS',
                'When you create an account with us, you are responsible for maintaining the security of your account. You agree to accept responsibility for all activities that occur under your account.',
              ),

              _buildSection(
                '5. INTELLECTUAL PROPERTY',
                'The content, features, and functionality of the App, including but not limited to text, graphics, logos, and software, are owned by Casino Quiz Pro and are protected by international copyright, trademark, and other intellectual property laws.',
              ),

              _buildSection(
                '6. USER CONDUCT',
                'You agree not to:\n\n• Use the App for any unlawful purpose\n• Attempt to interfere with the App\'s functionality\n• Reverse engineer or decompile any aspect of the App\n• Use automated systems to access the App\n• Impersonate any person or entity',
              ),

              _buildSection(
                '7. AGE RESTRICTION',
                'You must be at least 18 years old to use this App. By using the App, you represent and warrant that you are of legal age to form a binding contract.',
              ),

              _buildSection(
                '8. DISCLAIMER OF WARRANTIES',
                'The App is provided "AS IS" and "AS AVAILABLE" without any warranties of any kind. We do not warrant that the App will be uninterrupted, secure, or error-free.',
              ),

              _buildSection(
                '9. LIMITATION OF LIABILITY',
                'In no event shall Casino Quiz Pro be liable for any indirect, incidental, special, consequential or punitive damages resulting from your use or inability to use the App.',
              ),

              _buildSection(
                '10. MODIFICATIONS',
                'We reserve the right to modify or replace these Terms at any time. If a revision is material, we will provide at least 30 days\' notice prior to any new terms taking effect.',
              ),

              _buildSection(
                '11. TERMINATION',
                'We may terminate or suspend your account and access to the App immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
              ),

              _buildSection(
                '12. GOVERNING LAW',
                'These Terms shall be governed and construed in accordance with the laws of your jurisdiction, without regard to its conflict of law provisions.',
              ),

              _buildSection(
                '13. CONTACT US',
                'If you have any questions about these Terms, please contact us at support@casinoquizpro.com',
              ),

              const SizedBox(height: 24),

              Container(
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
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppTheme.accentGold,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'IMPORTANT NOTICE',
                      style: TextStyle(
                        color: AppTheme.accentGold,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This is an educational quiz application. No real money gambling is involved. All quiz content is for entertainment and learning purposes only.',
                      style: TextStyle(
                        color: AppTheme.textGray,
                        fontSize: 12,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
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
