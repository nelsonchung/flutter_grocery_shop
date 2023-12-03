import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // AppBar高度
  final appBarHeight = 80.h;

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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              toolbarHeight: appBarHeight,
              // centerTitle: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp),
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.w),
                            color: const Color(0xFFE3FBC0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.sp)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              size: 28.sp,
                              color: Colors.black,
                            ),
                            iconSize: 24,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.sp),
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.w),
                            color: const Color(0xFFE3FBC0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.sp)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                offset: const Offset(0, 3),
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
                      ),
                    ],
                  ),
                ],
              ),
              backgroundColor: Colors.transparent, //頂端bar底色透明
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
          ),
          Positioned(
            top: appBarHeight + MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height / 4.6.sp,
            child: Container(
              margin: EdgeInsets.all(10.sp),
              // ListView頭部有一段空白區域，是因為當ListView沒有和AppBar一起使用時，頭部會有一個padding，為了去掉padding，可以使用MediaQuery.removePadding
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 4.0, // 卡片阴影
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 6.sp),
                      child: ListTile(
                        leading: Icon(Icons.album), // 列表项的图标
                        title: Text('List Item ${index + 1}'), // 列表项的标题
                        subtitle: Text(
                            'Subtitle of List Item ${index + 1}'), // 列表项的副标题
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: appBarHeight + 430.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20.sp, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const Spacer(), // 往右靠
                        Text(
                          'Rs 710.00',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(height: 26.h),
                    Center(
                      child: SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.sp),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                // spreadRadius: 0,
                                // blurRadius: 3,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => NavPage(isActive: true),
                              //   ),
                              // );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(200, 186, 45, 1.0),
                              ),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.sp),
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Book Now',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Image.asset(
                                  'assets/icon/arrow1.png',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
