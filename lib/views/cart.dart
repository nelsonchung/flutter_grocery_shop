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

  // 也可以用products[index]['image']
  // final List<Map<String, dynamic>> products = [
  //   {
  //     'name': 'Banana',
  //     'image': 'assets/banana.png',
  //     'category': 'Fresh fruits',
  //     'price': 'Rs 50/kg',
  //     'quantity': 2
  //   },
  //   {
  //     'name': 'Pineapple',
  //     'image': 'assets/pineapple.png',
  //     'category': 'Fresh fruits',
  //     'price': 'Rs 120/kg',
  //     'quantity': 1
  //   },
  //   {
  //     'name': 'Tomato',
  //     'image': 'assets/tomato.png',
  //     'category': 'Fresh vegetable',
  //     'price': 'Rs 220/kg',
  //     'quantity': 1
  //   },
  //   {
  //     'name': 'Cabbage',
  //     'image': 'assets/cabbage.png',
  //     'category': 'Fresh vegetable',
  //     'price': 'Rs 80/kg',
  //     'quantity': 0
  //   },
  // ];

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
              margin: EdgeInsets.all(16.sp),
              // ListView頭部有一段空白區域，是因為當ListView沒有和AppBar一起使用時，頭部會有一個padding，為了去掉padding，可以使用MediaQuery.removePadding
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: const Color.fromRGBO(255, 255, 255, 0.3),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 10.sp),
                      child: Container(
                        padding: EdgeInsets.all(2.sp),
                        height: 100.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(231, 229, 229, 1.0),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          height: 100.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2.sp),
                                    height: 80.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            231, 229, 229, 1.0),
                                      ),
                                    ),
                                    child: Image.asset(
                                      items[index].image,
                                      fit: BoxFit.contain,
                                      width: 70.sp,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        items[index].name,
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        items[index].category,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Text(
                                        items[index].weight,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.all(2.sp),
                                height: 80.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.5),
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        231, 229, 229, 1.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    const Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                padding: EdgeInsets.only(left: 26.sp, right: 26.sp),
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
                              elevation: MaterialStateProperty.all(0.sp),
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

class Meal {
  const Meal({
    required this.name,
    required this.weight,
    required this.image,
    required this.category,
    required this.quantity,
    // required this.type,
  });

  final String name;
  final String weight;
  final String image;
  final String category;
  final int quantity;
  // final int type;
}

const items = [
  Meal(
    name: 'Banana',
    weight: 'Rs 50/kg',
    image: 'assets/icon/banana.png',
    category: 'Fesh fruits',
    quantity: 2,
  ),
  Meal(
    name: 'Pineapple',
    weight: 'Rs 120/kg',
    image: 'assets/icon/pineapple.png',
    category: 'Fesh fruits',
    quantity: 1,
  ),
  Meal(
    name: 'Tomato',
    weight: 'Rs 220/kg',
    image: 'assets/icon/tamato.png',
    category: 'Fesh vegetables',
    quantity: 1,
  ),
  Meal(
    name: 'Cabbage',
    weight: 'Rs 80/kg',
    image: 'assets/icon/Cabbage.png',
    category: 'Fesh vegetables',
    quantity: 1,
  ),
  Meal(
    name: 'Caulliflower',
    weight: 'Rs 140/kg',
    image: 'assets/icon/phoolgoubi.png',
    category: 'Fesh vegetables',
    quantity: 1,
  ),
];
