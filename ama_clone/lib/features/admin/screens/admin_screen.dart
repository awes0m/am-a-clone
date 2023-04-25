import 'package:ama_clone/features/admin/screens/products_screen.dart';
import 'package:ama_clone/features/admin/widgets/admin_screen_appbar.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const ProductsScreen(),
    const Center(child: Text('Analytics Screen')),
    const Center(child: Text('Order Screen')),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: adminAppBar(title: "Admin"),
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
          label: 'Products',
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
            child: const Icon(Icons.home_max_outlined),
          )),
      //profile
      BottomNavigationBarItem(
          label: 'Analytics',
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
            child: const Icon(Icons.analytics_outlined),
          )),
      //Orders
      BottomNavigationBarItem(
          label: 'Orders',
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
            child: const Icon(Icons.all_inbox_outlined),
          )),
    ];
  }
}
