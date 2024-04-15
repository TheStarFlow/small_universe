//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:small_universe/ability/navigator/route_navigator.dart';
import 'package:mmkv/mmkv.dart';

void main() {
  runApp(const SmallUniverse());
}

class SmallUniverse extends StatelessWidget {
  const SmallUniverse({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Colors.lightBlue.shade200),
            home: MainPage()));
  }
}

class MainPage extends StatelessWidget {
  final SmallUniverseRouteDelegate _delegate = SmallUniverseRouteDelegate();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //可以依据snapshot的状态返回不同的界面 例如正在加载转圈圈
          return Router(routerDelegate: _delegate);
        });
  }

  Future _initData() async {
    MMKV.initialize();
  }
}
