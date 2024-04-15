//     @Description
//     @Author zhongzusheng
//     @date 2024_04_06

import 'dart:async';

import 'package:flutter/material.dart';

class CountDownText extends StatefulWidget {
  CountDownText(this.onPressed, {this.isAutoCountDown = true, super.key});

  VoidCallback onPressed;

  bool isAutoCountDown;

  @override
  State<StatefulWidget> createState() {
    return _CountDownTextState();
  }
}

class _CountDownTextState extends State<CountDownText> {
  int countDown = 59;

  String buttonText = "";

  bool isCountDowning = false;

  @override
  void initState() {
    super.initState();
    buttonText = "重发验证码";
    if (widget.isAutoCountDown) {
      _onClick();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.lightBlueAccent;
    if (isCountDowning) {
      textColor = const Color(0xff999999);
    }
    return TextButton(
        onPressed: _onClick,
        child:
            Text(buttonText, style: TextStyle(fontSize: 12, color: textColor)));
  }

  void _onClick() {
    if (isCountDowning) return;
    isCountDowning = true;
    widget.onPressed.call();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countDown--;
        if (countDown == 0) {
          timer.cancel();
          isCountDowning = false;
          buttonText = "重发验证码";
          countDown = 59;
        } else {
          buttonText = "重发验证码($countDown)";
          isCountDowning = true;
        }
      });
    });
  }
}
