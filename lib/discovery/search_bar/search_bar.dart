//     @Description
//     @Author zhongzusheng
//     @date 2024_04_12

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class SearchBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBarWidget> {
  String _currPresetText = '小米su7';

  static const double search_height = 43;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(top: 56),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("发现",
                    style: TextStyle(fontSize: 24, color: Color(0xff333333))),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: RiveAnimation.network(
                    "https://static.xyzcdn.net/FvlB6lv5CFAv2BSClYqV1SWpqDLV.riv",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _onTapSearchBar(),
                      child: Container(
                        height: search_height,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(3)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.asset("images/search.webp"),
                              ),
                            ),
                            Expanded(
                                child: Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  _currPresetText,
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 12),
                                ),
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                    "images/scan.webp",
                                    color: Colors.grey.shade400,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: search_height,
                    height: search_height,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Transform.translate(
                          offset: const Offset(0, 1.5),
                          child: Align(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset("images/classify.png"),
                                ),
                                Text(
                                  "分类",
                                  style: TextStyle(
                                      fontSize: 8, color: Colors.grey.shade400),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  _onTapSearchBar() {}
}
