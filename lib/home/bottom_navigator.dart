//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'package:flutter/material.dart';
import 'package:small_universe/home/bottom_navigator_item.dart';

class MyBottomNavigator extends StatefulWidget {
  MyBottomNavigator({required this.onTap, super.key});

  ValueSetter<int> onTap;

  @override
  State<StatefulWidget> createState() {
    return _MyBottomNavigatorState();
  }
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  late Color selColor;
  late Color unselColor;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    selColor = Theme.of(context).primaryColor;
    unselColor = const Color(0xff999999);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkResponse(
          containedInkWell: false,
          onTap: () {
            _onTap(0);
          },
          child: MyNavigatorItem("images/discovery_sel.webp",
              "images/discovery_unsel.webp", "发现", 0,
              isSel: _isSelect, selColor: selColor, unselColor: unselColor),
        ),
        InkResponse(
          containedInkWell: false,
          onTap: () {
            _onTap(1);
          },
          child: MyNavigatorItem("images/subscription_sel.webp",
              "images/subsciption_unsel.webp", "订阅", 1,
              isSel: _isSelect, selColor: selColor, unselColor: unselColor),
        ),
        InkResponse(
          containedInkWell: false,
          onTap: () {
            _onTap(2);
          },
          child: MyNavigatorItem(
              "images/me_sel.webp", "images/me_unsel.webp", "个人", 2,
              isSel: _isSelect, selColor: selColor, unselColor: unselColor),
        )
      ],
    );
  }

  void _onTap(int index) {
    widget.onTap(index);
    setState(() {
      _currentIndex = index;
    });
  }

  bool _isSelect(int index) {
    return _currentIndex == index;
  }
}
