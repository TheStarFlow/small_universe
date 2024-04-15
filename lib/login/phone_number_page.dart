//     @Description
//     @Author zhongzusheng
//     @date 2024_03_28

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PhoneNumberPageState();
  }
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  TextEditingController controller = TextEditingController();

  static const double focusTopPadding = 128;
  static const double unfocusTopPadding = 168;

  late double topPadding;

  FocusNode node = FocusNode();

  @override
  void initState() {
    topPadding = focusTopPadding;
    node.addListener(() {
      if (node.hasFocus) {
        topPadding = focusTopPadding;
      } else {
        topPadding = unfocusTopPadding;
      }
      setState(() {});
    });
  }

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
                      "手机验证登录",
                      style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: topPadding, left: 40, right: 40),
                    child: Container(
                      width: double.infinity,
                      height: 53,
                      color: const Color(0xfff2f2f7),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 12, left: 12),
                            child: Text(
                              "+86",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightBlueAccent),
                            ),
                          ),
                          Container(
                            width: 3,
                            height: 28,
                            color: const Color(0xffe8e8e8e8),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              width: 196,
                              height: 53,
                              decoration: BoxDecoration(),
                              child: TextField(
                                focusNode: node,
                                controller: controller,
                                autofocus: true,
                                cursorColor: Colors.lightBlueAccent,
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "请输入你的手机号码",
                                    hintStyle:
                                        TextStyle(color: Color(0xffd2d2d2))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlueAccent),
                          minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 53)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)))),
                      onPressed: () {},
                      child: const Text(
                        "登录",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
