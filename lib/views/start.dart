import 'package:flutter/material.dart';
import 'package:flutter_grocery_shop/views/details.dart';
import 'package:flutter_grocery_shop/views/nav.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartPage extends StatefulWidget {
  StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      3,
      (index) => SizedBox(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon/start.png'),
              fit: BoxFit.contain,
            ),
          ),
          margin: const EdgeInsets.all(8).w,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetilsPage(image: 'assets/icon/banana.png'),
                ),
              );
            },
          ),
        ),
      ),
    );

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
          ListView(
            padding: EdgeInsets.all(10.sp),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 410.h,
                    width: 530.w,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: pages.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8.h,
                        dotWidth: 8.w,
                        dotColor: Colors.black,
                        activeDotColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Grocery Shop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                  Text(
                    'The easiest way to buy your grocery shopping',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x80000000),
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: 300.w,
                    height: 36.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFFC8BA2D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        elevation: 3.sp,
                        shadowColor: Colors.grey,
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
