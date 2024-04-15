//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'package:flutter/material.dart';

typedef ItemSelected = bool Function(int index);

class MyNavigatorItem extends StatelessWidget {
  MyNavigatorItem(
      this.selImageName, this.unselImageName, this.label, this.index,
      {required this.isSel,
      required this.selColor,
      required this.unselColor,
      super.key});

  String selImageName;

  String unselImageName;

  String label;

  Color selColor;

  Color unselColor;

  final int index;

  ItemSelected isSel;

  @override
  Widget build(BuildContext context) {
    String name;
    Color color;
    if (isSel(index)) {
      color = selColor;
      name = selImageName;
    } else {
      color = unselColor;
      name = unselImageName;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(
            name,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              label,
              style: TextStyle(color: color, fontSize: 10),
            ))
      ],
    );
  }
}
