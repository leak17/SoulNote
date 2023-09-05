import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('MMMM yyyy').format(now);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Text(
                      formattedDate, // Display current month and year
                      style: const TextStyle(
                        color: Color(0xff213A5C),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // Add spacing
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMoodIconWithNumber(
                            'awesome', Icons.sentiment_very_satisfied, 3),
                        _buildMoodIconWithNumber(
                            'happy', Icons.sentiment_satisfied, 9),
                        _buildMoodIconWithNumber(
                            'neutral', Icons.sentiment_neutral, 12),
                        _buildMoodIconWithNumber(
                            'bad', Icons.sentiment_dissatisfied, 5),
                        _buildMoodIconWithNumber(
                            'awful', Icons.sentiment_very_dissatisfied, 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodIconWithNumber(String label, IconData iconData, int number) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.black, // Change this to your desired icon color
          size: 36,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black, // Change this to your desired text color
            fontSize: 16,
          ),
        ),
        Text(
          '$number', // Display the associated number
          style: const TextStyle(
            color: Colors.black, // Change this to your desired text color
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
