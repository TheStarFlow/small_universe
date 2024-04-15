//     @Description
//     @Author zhongzusheng
//     @date 2024_04_06

import 'package:flutter/material.dart';

import 'package:small_universe/ability/font/my_font.dart';
import 'package:small_universe/discovery/discovery_page.dart';
import 'package:small_universe/home/bottom_navigator.dart';
import 'package:small_universe/me/me_page.dart';
import 'package:small_universe/subscription/subscription_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  static const int init_page = 0;

  final List<String> _titles = ["发现", "订阅", "个人"];

  final PageController _pageController = PageController(initialPage: init_page);

  int _currentIndex = init_page;

  final List<Widget> _navIcons = [
    const Icon(MyIcons.discovery),
    const Icon(MyIcons.subscription),
    const Icon(MyIcons.me),
  ];

  final List<Widget> _pageList = [
    const DiscoveryPage(),
    const SubscriptionPage(),
    const MePage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      theme: ThemeData(primaryColor: Colors.lightBlueAccent),
      home: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _pageList[index];
              },
              controller: _pageController,
              onPageChanged: _onPageChange,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(height: 100, color: Theme.of(context).primaryColor),
                  MyBottomNavigator(
                    onTap: _onTapItem,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTapItem(int index) {
    _pageController.jumpToPage(index);
  }

  List<BottomNavigationBarItem> _generateBottomNavList() {
    return List.generate(_titles.length, (index) {
      return BottomNavigationBarItem(
          icon: _navIcons[index], label: _titles[index]);
    });
  }
}
