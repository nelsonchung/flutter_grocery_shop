import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({super.key});

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<String> items = ['Fruits', 'Vegetables', 'Snacks', 'Drinks', 'Dairy'];

  int current = 0;

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
                          'Favorite',
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
                              Icons.more_vert,
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
            top: appBarHeight + 40.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.all(5.sp),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: StraggredDualView(
                          aspectRatio: 0.7,
                          spacing: 10,
                          itemBuilder: (ctx, index) {
                            return MeadlItem(
                              meal: fruits[index],
                            );
                          },
                          itemCount: fruits.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeadlItem extends StatelessWidget {
  const MeadlItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.sp),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          // debugPrint(meal.name);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DetilsPage(),
          //   ),
          // );
        },
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  meal.image,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                meal.name,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
              ),
              Text(
                meal.weight,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StraggredDualView extends StatelessWidget {
  const StraggredDualView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.spacing = 0.0,
    this.aspectRatio = 0.5,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemHeight = (width * 0.5) / aspectRatio;
        final height = constraints.maxHeight + itemHeight;
        return ClipRect(
          child: OverflowBox(
            maxWidth: width,
            minWidth: width,
            maxHeight: height,
            minHeight: height,
            child: GridView.builder(
              padding: EdgeInsets.only(top: itemHeight / 2, bottom: itemHeight),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
              ),
              itemBuilder: (context, index) {
                return Transform.translate(
                  offset: Offset(0.0, index.isOdd ? 0.0 : itemHeight * 0.0),
                  child: itemBuilder(context, index),
                );
              },
              itemCount: itemCount,
            ),
          ),
        );
      },
    );
  }
}

class Meal {
  const Meal({
    required this.name,
    required this.weight,
    required this.image,
    // required this.type,
  });

  final String name;
  final String weight;
  final String image;
  // final int type;
}

const fruits = [
  Meal(
    name: 'Banana',
    weight: 'Rs 50/kg',
    image: 'assets/icon/banana.png',
  ),
  Meal(
    name: 'Orange',
    weight: 'Rs 70/kg',
    image: 'assets/icon/orange.png',
  ),
  Meal(
    name: 'Pineapple',
    weight: 'Rs 120/kg',
    image: 'assets/icon/pineapple.png',
  ),
  Meal(
    name: 'Lemon',
    weight: 'Rs 80/kg',
    image: 'assets/icon/lemon.png',
  ),
  Meal(
    name: 'Mango',
    weight: 'Rs 100/kg',
    image: 'assets/icon/mango.png',
  ),
  Meal(
    name: 'Licchi',
    weight: 'Rs 220/kg',
    image: 'assets/icon/licchi.png',
  ),
  Meal(
    name: 'Kivi',
    weight: 'Rs 80/kg',
    image: 'assets/icon/kivi.png',
  ),
  Meal(
    name: 'Cherry',
    weight: 'Rs 300/kg',
    image: 'assets/icon/cherry.png',
  ),
];

const vegetables = [
  Meal(
    name: 'Tamato',
    weight: 'Rs 220/kg',
    image: 'assets/icon/tamato.png',
  ),
  Meal(
    name: 'Capsicum',
    weight: 'Rs 100/kg',
    image: 'assets/icon/capsicum.png',
  ),
  Meal(
    name: 'Sw.Pumpkin',
    weight: 'Rs 100/kg',
    image: 'assets/icon/sweetpamkin.png',
  ),
  Meal(
    name: 'Carrot',
    weight: 'Rs 60/kg',
    image: 'assets/icon/carrot.png',
  ),
  Meal(
    name: 'Broccoli',
    weight: 'Rs 180/kg',
    image: 'assets/icon/broccoli.png',
  ),
  Meal(
    name: 'Cauliflower',
    weight: 'Rs 220/kg',
    image: 'assets/icon/phoolgoubi.png',
  ),
  Meal(
    name: 'Bitter gourd',
    weight: 'Rs 80/kg',
    image: 'assets/icon/krele.png',
  ),
  Meal(
    name: 'Cabbage',
    weight: 'Rs 300/kg',
    image: 'assets/icon/Cabbage.png',
  ),
];
