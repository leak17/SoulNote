import 'package:flutter/material.dart';
import 'package:diary_journal/core/routes/app_routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 260,
            width: double.infinity,
            color: const Color(0xffDDE1E0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Your Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff223A5C),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/Profile.png'),
                    ),
                    Positioned(
                      bottom: -7,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.START);
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Color.fromARGB(255, 52, 191, 234),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sak Lysem',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff223A5C),
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Sak.lysem19@kit.ed.kh',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(34, 58, 92, 0.5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  child: Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(34, 58, 92, 0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Text(
                        'Total Diary:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff223A5C),
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text(
                          '120',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff223A5C),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.START);
                    },
                    child: const Text('Logout'),
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
