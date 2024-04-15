//     @Description  验证码输入框
//     @Author zhongzusheng
//     @date 2024_03_29

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:small_universe/login/input/input_unit.dart';

typedef CodeInput = Future<bool> Function(String text);

class InputCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputCodeState();
  }

  int count = 4;

  InputCode({super.key, this.count = 4});

  CodeInput? onCodeInput;
}

class _InputCodeState extends State<InputCode> {
  List<InputUnit>? inputUnits;

  void _reset() {
    if (inputUnits == null) return;
    setState(() {
      InputUnit unit;
      for (unit in inputUnits!) {
        unit.controller.text = '';
        unit.state.setIsNumInput(false);
      }
      inputUnits![0].node.requestFocus();
    });
  }

  FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    call(int index, String text) async {
      //输入完所有验证码,回调接口返回数据
      if (index == widget.count - 1 && text.isNotEmpty) {
        InputUnit unit;
        String result = '';
        for (unit in inputUnits!) {
          result = result + unit.controller.text;
        }
        bool? verify = await widget.onCodeInput?.call(result);
        if (verify == false) {
          _reset();
        }
        return;
      }
      if (text.isNotEmpty && index + 1 <= widget.count) {
        inputUnits![index + 1].node.requestFocus();
      } else if (text.isEmpty && index - 1 >= 0) {
        inputUnits![index - 1].node.requestFocus();
      }
    }

    inputUnits ??= List.generate(widget.count, (index) {
      return InputUnit(index)..textInput = call;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
        onKeyEvent: (node, event) {
          if (event.logicalKey == LogicalKeyboardKey.backspace &&
              event is KeyDownEvent) {
            InputUnit unit;
            int index = 0;
            for (unit in inputUnits!) {
              //代表输入到一半 输错了 想删除首尾除外的单元的数字
              if (unit.node.hasFocus && unit.controller.text.isEmpty) {
                index = unit.index;
                break;
              }
            }
            if (index == widget.count || index == 0) {
              return KeyEventResult.ignored;
            }
            int preIndex = index - 1;
            if (preIndex >= 0) {
              inputUnits![preIndex].controller.text = '';
              inputUnits![preIndex].state.setIsNumInput(false);
              inputUnits![preIndex].node.requestFocus();
            }
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        },
        focusNode: node,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: inputUnits!,
        ));
  }
}
