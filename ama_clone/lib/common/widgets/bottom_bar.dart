import 'package:ama_clone/constants/global_variables.dart';
import 'package:ama_clone/features/account/screens/account_screen.dart';
import 'package:ama_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart Screen')),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        showUnselectedLabels: false,
        currentIndex: _page,
        onTap: updatePage,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: bottomNavBarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get bottomNavBarItems {
    return [
      //home
      BottomNavigationBarItem(
          label: 'Home',
          icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: _page == 0
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
              width: bottomBarBorderWidth,
            ))),
            child: const Icon(Icons.home_outlined),
          )),
      //profile
      BottomNavigationBarItem(
          label: 'Profile',
          icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: _page == 1
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
              width: bottomBarBorderWidth,
            ))),
            child: const Icon(Icons.person_outline),
          )),
      //Cart
      BottomNavigationBarItem(
          label: 'Cart',
          icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: _page == 2
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
              width: bottomBarBorderWidth,
            ))),
            child: Badge(
              label: const Text(
                '2',
                style: TextStyle(color: Colors.black),
              ),
              textStyle: const TextStyle(color: Colors.black),
              backgroundColor: Colors.yellow[200],
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ))
    ];
  }
}
