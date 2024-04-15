//     @Description
//     @Author zhongzusheng
//     @date 2024_03_29

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:small_universe/login/input/count_down_text.dart';
import 'package:small_universe/login/input/input_code_widget.dart';
import 'package:small_universe/login/input/input_unit.dart';

class AuthCodePage extends StatefulWidget {
  const AuthCodePage({super.key});

  @override
  State<StatefulWidget> createState() => _AuthCodeState();
}

class _AuthCodeState extends State<AuthCodePage> {
  String? phoneNum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      home: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 56, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      //todo 关闭当前页面
                    },
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("images/close.png"),
                    ),
                  )),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 128),
                    child: Text(
                      "请输入验证码",
                      style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                    ),
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "已将验证码发送至$phoneNum",
                        style: const TextStyle(
                            color: Color(0xff999999), fontSize: 12)),
                    TextSpan(
                        text: " 更换",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            color: Color(0xff666666), fontSize: 13))
                  ])),
                  Padding(
                      padding: const EdgeInsets.only(top: 96),
                      child: InputCode(count: 4)
                        ..onCodeInput = (text) {
                          return Future.delayed(const Duration(seconds: 3))
                              .then((value) => false);
                        })
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: CountDownText(() {
                  print("点击发送验证码");
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
