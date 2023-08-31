import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        backgroundColor: const Color(0xFF213A5C),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal margin
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Image.asset(
                  'assets/images/logo.png', // Replace with your app logo image path
                  width: 100, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
              ),
              _buildSection(
                title: 'Effective Date: today onward',
                content: 'Regulations to follow',
                centerTitle: true, // Center the title
              ),
              SizedBox(height: 16),
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
                content:
                    'We can suspend or terminate accounts for violations.',
              ),
              SizedBox(height: 16), // Add some vertical space between sections
              Text(
                'By using SoulNote, you agree to these terms.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, // Center-align this text
              ),
              SizedBox(height: 16),
              // Add more terms and conditions items here
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
      crossAxisAlignment: centerTitle
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF213A5C),
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 8), // Reduce vertical space between title and content
      ],
    );
  }
}
