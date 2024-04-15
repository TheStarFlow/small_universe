import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_universe/ability/font/my_font.dart';
import 'package:small_universe/ability/navigator/navigator.dart';
import 'package:small_universe/ability/navigator/route_navigator.dart';
import 'package:small_universe/welcome/image_box.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late List<int> images;

  List<int> currImages = [];
  static const _count = 10;
  List<int> tempImages = [];

  bool isCheckBoxCheck = false;

  static const int _split = 3;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 7));
    images = List.generate(30, (index) => index + 1);
    currImages.addAll(images.take(_count));
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        tempImages.clear();
        images.shuffle(Random(28));
        tempImages.addAll(images);
        tempImages.removeWhere((element) => currImages.contains(element));
        currImages.clear();
        currImages.addAll(tempImages.take(_count));
        controller.reset();
        setState(() {});
        controller.forward();
      }
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 状态栏背景透明
      statusBarBrightness: Brightness.dark, // 状态栏上文字为白色
      statusBarIconBrightness: Brightness.dark, // 状态栏图标为黑色
    ));
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            alignBox(controller, -0.05, 0.15, 140, 140,
                'home_${currImages[0]}.webp', 4, -3),
            alignBox(controller, 0.52, 0.1, 90, 90,
                'home_${currImages[1]}.webp', 6, -3),
            alignBox(controller, 1, 0.15, 110, 110,
                'home_${currImages[2]}.webp', 5, -3),
            alignBox(controller, 0.4, 0.25, 110, 110,
                'home_${currImages[3]}.webp', 5, -4),
            alignBox(controller, -0.05, 0.5, 105, 105,
                'home_${currImages[4]}.webp', 4, -6),
            alignBox(controller, 0.45, 0.52, 100, 100,
                'home_${currImages[5]}.webp', 3, -6),
            alignBox(controller, 0.9, 0.35, 100, 100,
                'home_${currImages[6]}.webp', 4, -5),
            alignBox(controller, 0.2, 0.35, 80, 80,
                'home_${currImages[7]}.webp', 5, -5.5),
            alignBox(controller, 0.7, 0.45, 80, 80,
                'home_${currImages[8]}.webp', 4, -6),
            alignBox(controller, 1.15, 0.52, 100, 100,
                'home_${currImages[9]}.webp', 4, -6.5),
            buildPadding(height),
            buildCover(height),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: height / _split,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 160,
                      child: Image.asset("images/xyz.webp"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: Colors.grey,
                            value: isCheckBoxCheck,
                            onChanged: (value) {
                              isCheckBoxCheck = !isCheckBoxCheck;
                              setState(() {});
                            }),
                        Text.rich(TextSpan(children: [
                          const TextSpan(
                              text: "我已阅读并同意",
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xffdddddd))),
                          TextSpan(
                              text: "《用户协议》",
                              style: const TextStyle(
                                  fontSize: 11, color: Color(0xff999999)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //todo  跳转用户协议
                                }),
                          const TextSpan(
                              text: "和",
                              style: TextStyle(
                                  fontSize: 11, color: Color(0xffdddddd))),
                          TextSpan(
                              text: "《隐私政策》",
                              style: const TextStyle(
                                  fontSize: 11, color: Color(0xff999999)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //todo  跳转隐私政策
                                }),
                        ]))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: TextButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff4BAF50)),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(320, 53)),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)))),
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                              onPressed: () {
                                //点击微信登录
                                _launchLogin(context, true, () {});
                              },
                              label: const Text(
                                "微信登录",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              icon: const Icon(
                                MyIcons.wechat,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                            /* Container(
                            width: 320,
                            height: 53,
                            color: const Color(0xff4BAF50),
                            child: Center(
                              child: ,
                            ),
                          ),*/
                            )),
                    TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      onPressed: () {
                        //点击手机号登录
                        _launchLogin(context, false, () {});
                      },
                      child: const Text("手机号登录",
                          style: TextStyle(
                              color: Color(0xffdddddd),
                              fontSize: 12,
                              decoration: TextDecoration.none)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchLogin(
      BuildContext context, bool isWx, VoidCallback callback) async {
    if (!isCheckBoxCheck) {
      var code = await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) {
            return AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: const Text("提示"),
              contentPadding: const EdgeInsets.all(20),
              buttonPadding: EdgeInsets.zero,
              actionsPadding: const EdgeInsets.all(4),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              titleTextStyle:
                  const TextStyle(fontSize: 16, color: Color(0xff333333)),
              content: Text.rich(TextSpan(children: [
                const TextSpan(
                    text: "请先阅读并同意",
                    style: TextStyle(fontSize: 13, color: Color(0xff999999))),
                TextSpan(
                    text: "《用户协议》",
                    style: const TextStyle(
                        fontSize: 13, color: Colors.lightBlueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //todo  跳转用户协议
                      }),
                const TextSpan(
                    text: "和",
                    style: TextStyle(fontSize: 13, color: Color(0xff999999))),
                TextSpan(
                    text: "《隐私政策》",
                    style: const TextStyle(
                        fontSize: 13, color: Colors.lightBlueAccent),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //todo  跳转隐私政策
                      }),
              ])),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(0);
                    },
                    child: const Text(
                      "取消",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.normal),
                    )),
                TextButton(
                    onPressed: () {
                      isCheckBoxCheck = true;
                      setState(() {});
                      Navigator.of(ctx).pop(1);
                    },
                    child: const Text(
                      "同意并登录",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.normal),
                    ))
              ],
            );
          });
      if (code == 1) {
        //跳转登录
        if (isWx) {
          MyNavigator.getInstance().onJumpTo(RouteStatus.home);
        }
      }
    } else {
      if (isWx) {
        //跳转Wx登录
        MyNavigator.getInstance().onJumpTo(RouteStatus.home);
      }
    }
  }

  Padding buildPadding(double height) {
    return Padding(
      padding: EdgeInsets.only(bottom: height / _split),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: height / _split,
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Color(0x00ffffff)])),
        ),
      ),
    );
  }

  Widget buildCover(double height) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height / _split,
        color: Colors.white,
      ),
    );
  }

  Widget alignBox(AnimationController controller, double dx, double dy,
      double width, double height, String path, double start, double end) {
    return Align(
        alignment: FractionalOffset(dx, dy),
        child: ImagePositionBox(width, height,
            image: path, start: start, end: end, controller: controller));
  }
}
