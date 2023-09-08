import 'package:diary_journal/theme/theme_color.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ThemeColor.colorScheme.onSecondary,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Terms and Conditions',
          style: TextStyle(
            fontFamily: 'KantumruyPro',
            color: ThemeColor.colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        backgroundColor: ThemeColor.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              _buildSection(
                title: 'Effective Date: today onward',
                content: 'Regulations to follow',
                centerTitle: true,
              ),
              const SizedBox(height: 16),
              _buildSection(
                title: '1. User Agreement',
                content:
                    'By using SoulNote, you accept our User Agreement. Refrain from using the App if you disagree.',
              ),
              _buildSection(
                title: '2. Data Responsibility',
                content:
                    'Protect your account information. Unauthorized usage is your responsibility.',
              ),
              _buildSection(
                title: '3. Content Ownership',
                content:
                    'You own your User Content, but we can use it within the App.',
              ),
              _buildSection(
                title: '4. Privacy',
                content:
                    'We handle your data as outlined in our Privacy Policy.',
              ),
              _buildSection(
                title: '5. Termination',
                content: 'We can suspend or terminate accounts for violations.',
              ),
              const SizedBox(height: 16),
              Text(
                'By using SoulNote, you agree to these terms.',
                style: TextStyle(
                  fontFamily: 'KantumruyPro',
                  fontSize: 16,
                  color: ThemeColor.colorScheme.surface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    bool centerTitle = false,
  }) {
    return Column(
      crossAxisAlignment:
          centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 3,
          style: TextStyle(
            fontFamily: 'KantumruyPro',
            fontSize: 16,
            wordSpacing: 2,
            fontWeight: FontWeight.bold,
            color: ThemeColor.mainColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          maxLines: 3,
          style: TextStyle(
            fontFamily: 'KantumruyPro',
            wordSpacing: 2,
            fontSize: 14,
            color: ThemeColor.colorScheme.surface,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
