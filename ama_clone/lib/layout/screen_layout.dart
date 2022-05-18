import 'package:ama_clone/utils/color_themes.dart';
import 'package:ama_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  static const String routeName = '/screenLayout';
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  changePage(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutBack);
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: screenlist,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey[400]!, width: 1)),
          ),
          child: TabBar(
              indicator: const BoxDecoration(
                border:
                    Border(top: BorderSide(color: activeCyanColor, width: 2)),
              ),
              onTap: changePage,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.home_outlined,
                  color: _currentPage == 0 ? activeCyanColor : Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.account_circle_outlined,
                  color: _currentPage == 1 ? activeCyanColor : Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: _currentPage == 2 ? activeCyanColor : Colors.black,
                )),
                Tab(
                    icon: Icon(
                  Icons.more_outlined,
                  color: _currentPage == 3 ? activeCyanColor : Colors.black,
                )),
              ]),
        ),
      ),
    );
  }
}
