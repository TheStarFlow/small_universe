//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MeState();
  }
}

class _MeState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    print("=========> 个人页面,build");
    return const Text("个人页面");
  }
}
