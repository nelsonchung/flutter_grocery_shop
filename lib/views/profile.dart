import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/01.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Center(
            child: Text("無設計"),
          ),
        ],
      ),
    );
  }
}
