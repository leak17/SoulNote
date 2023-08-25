import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('MMMM yyyy').format(now);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 93,
            width: double.infinity,
            color: const Color(
                0xff213A5C), // Change this to your desired background color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 16),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.white, // Change this to your desired color
                    child: Image.asset(
                      'assets/images/diary_logo.png', // Replace with your logo image path
                      width: 24,
                      height: 24,
                      // Change this to your desired color
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: const Text(
                    "Sak Lysem",
                    style: TextStyle(
                      color: Color(
                          0xffDAE2E6), // Change this to your desired text color
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 16.0, right: 10), // Add top margin of 10px
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/Profile.png', // Replace with your profile pic image path
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
