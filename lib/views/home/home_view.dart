// import 'package:flutter/material.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//           child: Text(
//         "SoulNote",
//         style: TextStyle(
//             fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold),
//       )),
//     );
//   }
// }

import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SoulNote",
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Sign In page using GetX
                Navigator.pushNamed(context, Routes.SIGN_IN);
                // Get.pushNamed(Routes.SIGN_IN);
              },
              child: const Text("Sign In"),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                // Handle Sign Up button press
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
