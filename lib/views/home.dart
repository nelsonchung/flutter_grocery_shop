import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80.h,
        // centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min, // Use min size to fit the content
          children: <Widget>[
            SizedBox(height: 16.h),
            Text(
              'Daily',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Grocery Food',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
        backgroundColor: Colors.transparent, //頂端bar底色透明
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.sp),
            child: Container(
              // width: 50,
              height: 60.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.w),
                color: Color(0xFFE3FBC0),
                borderRadius: BorderRadius.all(Radius.circular(25.sp)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    // spreadRadius: 2,
                    // blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 28.sp,
                  color: Colors.black,
                ),
                iconSize: 24,
                onPressed: () {},
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                ],
              ),
            ],
          ),
          ListView(
            padding: EdgeInsets.all(10.sp),
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
