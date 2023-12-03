import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grocery_shop/views/nav.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetilsPage extends StatefulWidget {
  final String image;
  DetilsPage({super.key, required this.image});
  // widget.image

  @override
  _DetilsPageState createState() => _DetilsPageState();
}

class _DetilsPageState extends State<DetilsPage> {
  final controller = PageController(viewportFraction: 1.0, keepPage: true);

  // AppBar高度
  final appBarHeight = 80.h;

  // see more
  String text =
      'Banana is a very good fruit for body health and extra vitamin and extra energy for body. this is a increase of body for baby and boys';
  bool isExpanded = false;

  // Related Items
  List<String> items = [
    'assets/icon/orange.png',
    'assets/icon/cherry.png',
    'assets/icon/kivi.png',
    'assets/icon/mango.png'
  ];

  // int current = 0;

  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      3,
      (index) => Container(
        margin: const EdgeInsets.all(8).w,
        child: Image.asset(
          widget.image,
          fit: BoxFit.contain,
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
                          'Details',
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
                              isActive ? Icons.favorite : Icons.favorite_border,
                              size: 28.sp,
                              color: isActive ? Colors.red : null,
                            ),
                            iconSize: 24,
                            onPressed: () {
                              setState(() {
                                isActive = !isActive;
                              });
                            },
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
            top: appBarHeight,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.all(5.sp),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  // SizedBox(height: 16.h),
                  SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  // SizedBox(height: 20.h),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: pages.length,
                      effect: ScrollingDotsEffect(
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                        dotColor: const Color.fromRGBO(
                            254, 223, 106, 0.699999988079071),
                        activeDotColor: const Color.fromRGBO(
                            255, 221, 88, 0.8500000238418579),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          Positioned(
            top: appBarHeight + 230.h,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fresh Banana',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color:
                                      const Color.fromRGBO(254, 223, 103, 1.0),
                                  size: 22.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(232, 196, 59, 1.0),
                                borderRadius: BorderRadius.circular(12.sp),
                                // border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "2kg",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(232, 196, 59, 1.0),
                                borderRadius: BorderRadius.circular(12.sp),
                                // border: Border.all(color: Colors.grey),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            text: isExpanded
                                ? '$text\n'
                                : '${text.substring(0, 100)}...',
                            style: TextStyle(fontSize: 16.sp),
                            children: <TextSpan>[
                              TextSpan(
                                text: isExpanded ? 'Close' : ' See more',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Related Items',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 6.h),
                    SizedBox(
                      height: 90.h,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            // onTap: () {
                            //   setState(() {
                            //     current = index;
                            //     // debugPrint("index: $index");
                            //   });
                            // },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 0),
                              margin: EdgeInsets.all(5.sp),
                              width: 70.w,
                              // height: 45.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // color: current == index
                                //     ? const Color.fromRGBO(250, 230, 30, 1)
                                //     : const Color.fromRGBO(
                                //         153, 151, 138, 0.8199999928474426),
                                borderRadius: BorderRadius.circular(15.sp),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    // spreadRadius: 0,
                                    // blurRadius: 3,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  items[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: const Color(0x7FFCE924),
        child: SizedBox(
          width: 60.w,
          height: 60.h,
          child: Padding(
            padding: EdgeInsets.only(left: 20.sp, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Price\n',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Rs 50/kg',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(), // 往右靠
                SizedBox(
                  width: 200.w,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavPage(isActive: true),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(
                                  250, 225, 51, 0.699999988079071),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Image.asset(
                            'assets/icon/arrow.png',
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
