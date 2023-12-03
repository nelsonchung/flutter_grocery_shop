import 'package:flutter/material.dart';
import 'package:flutter_grocery_shop/views/cart.dart';
import 'package:flutter_grocery_shop/views/favourite.dart';
import 'package:flutter_grocery_shop/views/home.dart';
import 'package:flutter_grocery_shop/views/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavPage extends StatefulWidget {
  final bool isActive;
  const NavPage({super.key, this.isActive = false});

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  final pages = [HomePage(), FavouritePage(), CartPage(), ProfilePage()];

  // 定義顏色
  final Color activeColor = Colors.red;
  final Color inactiveColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.isActive ? 2 : 0;
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.isActive ? 2 : 0);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Material(
        color: const Color(0x7FFCE924),
        child: TabBar(
          controller: _tabController,
          indicator: TopIndicator(),
          tabs: <Widget>[
            buildTab(0, 'assets/icon/home.png', 'Home'),
            buildTab(1, 'assets/icon/Favourite.png', 'Favourite'),
            buildTab(2, 'assets/icon/Cart.png', 'My Cart'),
            buildTab(3, 'assets/icon/Profile.png', 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget buildTab(int index, dynamic icon, String text) {
    bool isActive = index == _currentIndex;
    Color color = isActive ? activeColor : inactiveColor;

    return SizedBox(
      width: 60.w,
      height: 60.h,
      child: Tab(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              icon,
              height: 24.h,
              width: 24.w,
              color: isActive ? color : null, // 圖片顏色變化
            ),
            // : Icon(icon, color: color),
            SizedBox(height: 1.h), // 間距
            // Text(text, style: TextStyle(color: color)),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final width = cfg.size?.width ?? 0; // Safe access
    Paint _paint = Paint()
      ..color = const Color.fromRGBO(255, 97, 97, 1)
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(width + offset.dx, 0), _paint);
  }
}
