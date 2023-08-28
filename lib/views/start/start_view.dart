import 'package:diary_journal/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  StartViewState createState() => StartViewState();
}

class StartViewState extends State<StartView> {
  late PageController _pageController;
  int _currentPage = 0;
  final int _numPages = 3; // Number of pages (images) in your PageView

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < _numPages - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _currentPage++;
        _startAutoScroll(); // Call again for the next auto-scroll
      } else {
        // Reset to the first page and restart auto-scroll
        _pageController.jumpToPage(0);
        _currentPage = 0;
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your PageView with auto-scroll
            SizedBox(
              height: 350,
              width: 220,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset('assets/images/slide_img1.png'),
                  Image.asset('assets/images/slide_img2.png'),
                  Image.asset('assets/images/slide_img3.png'),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(right: 85),
              child: Text(
                "Enjoy Your Mood \nNotice",
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xff213A5C),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                "Notice your mood and track output everyday. Find your strength and weakness to improve to gain more effective habit, productivity.",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff213A5C),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 310,
              child: TextButton(
                onPressed: () {
                  // Navigate to the Sign In page using GetX
                  Navigator.pushNamed(context, Routes.SIGN_IN);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff213A5C)),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: 310,
              child: TextButton(
                onPressed: () {
                  // Handle Sign Up button press
                  Navigator.pushNamed(context, Routes.SIGN_UP);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(33, 58, 92, 0.3)),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff213A5C),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
