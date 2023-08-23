import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xffDDE1E0),
    body: Column(
      children: [
        CustomAppBar(),
        SizedBox(width: 16),
        Padding(
          padding: EdgeInsets.only(top: 16), // Add top padding
          child: Row(
            children: [
              SizedBox(width: 16), // Add left margin
              GestureDetector(
                onTap: () {
                  // Handle back button tap
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: const Color(0xFF213A5C), // Change the background color here
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white, // Change the icon color here
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16), // Add space between back icon and date button
              Expanded(
                child: TextButton(
                  onPressed: () {
                    // Handle date button tap
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF213A5C), // Change the background color here
                  ),
                  child: Text(
                    "01 Jan 2023", // Replace with your formatted date
                    style: TextStyle(color: Colors.white), // Change the text color here
                  ),
                ),
              ),
              SizedBox(width: 16), // Add space between date button and save button
              Padding(
                padding: EdgeInsets.only(right: 25), // Add right margin
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save operation
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF213A5C), // Change the button color here
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: JournalBox(),
          ),
        ),
      ],
    ),
  );
}

}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF213A5C),
      height: 100,
      padding: EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 40,
            height: 40,
          ),
          Text(
            'Sak Lysem',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xffDDE1E0),
            ),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9qMp3RM66v5flm1qdQm-xI8qajl0USrQT2A&usqp=CAU',
            ),
            radius: 20,
          ),
        ],
      ),
    );
  }
}

class JournalBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 86, 143, 170),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0), // Left, Top, Right, Bottom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
                icon: Icon(
                  Icons.emoji_emotions,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Adding a small space between title and input
          Container(
            height: 1, // Divider height
            color: Colors.white,
          ),
          SizedBox(height: 8), // Adding a small space between input and divider
          Expanded(
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
                  icon: Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle emoji selection
                  },
                  icon: Icon(
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
                          title: Text(
                            "Confirm Delete",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Customize the color
                            ),
                          ),
                          content: Text("Are you sure to delete your journal?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform the actual delete operation here
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text(
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
                  icon: Icon(
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
