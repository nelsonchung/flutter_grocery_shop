import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Index(),
      //關閉右上角debug標籤
      debugShowCheckedModeBanner: false,
    );
  }
}

// 待製作滑動頁面，要新增自適應功能
// https://blog.csdn.net/weixin_44486516/article/details/123394792
// 製作完後，定出架構
class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/01.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 393,
              height: 525,
              child: Image.asset('assets/icon/home.png'),
            ),
            const Text(
              'Grocery Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const Text(
              'The easiest way to buy your grocery shopping',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0x80000000),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFC8BA2D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                elevation: 5,
                shadowColor: Colors.grey,
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
