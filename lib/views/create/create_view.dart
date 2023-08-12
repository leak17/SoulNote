import 'package:diary_journal/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(top: 16), // Add top padding
            child: Row(
              children: [
                const SizedBox(width: 16), // Add left margin
                GestureDetector(
                  onTap: () {
                    // Handle back button tap
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color:
                          Color(0xFF213A5C), // Change the background color here
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white, // Change the icon color here
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    width: 16), // Add space between back icon and date button
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Handle date button tap
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF213A5C), // Change the background color here
                    ),
                    child: const Text(
                      "01 Jan 2023", // Replace with your formatted date
                      style: TextStyle(
                          color: Colors.white), // Change the text color here
                    ),
                  ),
                ),
                const SizedBox(
                    width: 16), // Add space between date button and save button
                Padding(
                  padding: const EdgeInsets.only(right: 25), // Add right margin
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle save operation
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF213A5C), // Change the button color here
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: JournalBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class JournalBox extends StatelessWidget {
  const JournalBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 86, 143, 170),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(top: 16),
      padding:
          const EdgeInsets.fromLTRB(16, 16, 16, 0), // Left, Top, Right, Bottom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'What is your title?',
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Handle emoji icon tap
                },
                icon: const Icon(
                  Icons.emoji_emotions,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 8), // Adding a small space between title and input
          Container(
            height: 1, // Divider height
            color: Colors.white,
          ),
          const SizedBox(
              height: 8), // Adding a small space between input and divider
          const Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "What's on your mind?",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Handle picture upload
                  },
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle emoji selection
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Confirm Delete",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Customize the color
                            ),
                          ),
                          content: const Text(
                              "Are you sure to delete your journal?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform the actual delete operation here
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.red, // Customize the color
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
