import 'package:flutter/material.dart';
import 'package:flutter_grocery_shop/views/cart.dart';
import 'package:flutter_grocery_shop/views/favourite.dart';
import 'package:flutter_grocery_shop/views/home.dart';
import 'package:flutter_grocery_shop/views/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  final pages = [HomePage(), FavouritePage(), CartPage(), ProfilePage()];

  // 定義顏色
  final Color activeColor = Colors.red; // 激活狀態的顏色
  final Color inactiveColor = Colors.grey; // 非激活狀態的顏色

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

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
        color: Color(0x7FFCE924),
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
      width: 55.w,
      height: 55.h,
      child: Tab(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            icon is String
                ? Image.asset(
                    icon,
                    height: 24.h,
                    width: 24.w,
                    color: isActive ? color : null, // 圖片顏色變化
                  )
                : Icon(icon, color: color),
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
      ..color = Color.fromRGBO(255, 97, 97, 1)
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(width + offset.dx, 0), _paint);
  }
}

// class _NavPageState extends State<NavPage> {
//   int _currentIndex = 0; // Default value
//   final pages = [HomePage(), FavouritePage(), CartPage(), ProfilePage()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[_currentIndex],
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(top: 4.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TabIndicators(
//               activeIdx: _currentIndex,
//               activeColor: Theme.of(context).primaryColor,
//               numTabs: 4,
//               padding: 0,
//               height: 4,
//             ),
//             BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.favorite), label: 'Favourites'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.shopping_cart), label: 'Cart'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.account_circle), label: 'Profile'),
//               ],
//               currentIndex: _currentIndex,
//               selectedItemColor: Colors.red,
//               onTap: _onItemClick,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onItemClick(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
// }

// class TabIndicators extends StatelessWidget {
//   final int _numTabs;
//   final int _activeIdx;
//   final Color _activeColor;
//   final Color _inactiveColor;
//   final double _padding;
//   final double _height;

//   const TabIndicators(
//       {required int numTabs,
//       required int activeIdx,
//       required Color activeColor,
//       required double padding,
//       required double height,
//       Color inactiveColor = const Color(0x00FFFFFF),
//       Key? key})
//       : _numTabs = numTabs,
//         _activeIdx = activeIdx,
//         _activeColor = activeColor,
//         _inactiveColor = inactiveColor,
//         _padding = padding,
//         _height = height,
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final elements = <Widget>[];

//     for (var i = 0; i < _numTabs; ++i) {
//       elements.add(Expanded(
//           child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: _padding),
//         child:
//             Container(color: i == _activeIdx ? _activeColor : _inactiveColor),
//       )));
//     }

//     return SizedBox(
//       height: _height,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: elements,
//       ),
//     );
//   }
// }
