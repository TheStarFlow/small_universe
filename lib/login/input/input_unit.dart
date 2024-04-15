//     @Description
//     @Author zhongzusheng
//     @date 2024_03_29

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnTextInput = void Function(int index, String text);

class InputUnit extends StatefulWidget {
  TextEditingController controller = TextEditingController();

  late InputUnitState state;

  final int index;

  InputUnit(this.index, {super.key});

  OnTextInput? textInput;

  bool isNumInput = false;

  FocusNode node = FocusNode();

  @override
  State<StatefulWidget> createState() {
    return InputUnitState();
  }
}

class InputUnitState extends State<InputUnit> {
  @override
  void initState() {
    widget.state = this;
  }

  void setIsNumInput(bool input) {
    setState(() {
      widget.isNumInput = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = Colors.lightBlueAccent;
    if (widget.controller.text.isNotEmpty || widget.isNumInput) {
      bgColor = Colors.transparent;
    }
    final bool autoFocus = widget.index == 0;
    return SizedBox(
        width: 60,
        height: 60,
        child: Center(
            child: Stack(
          children: [
            Center(
              child: Container(
                width: 6,
                height: 14,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(4)),
              ),
            ),
            TextField(
              autofocus: autoFocus,
              focusNode: widget.node,
              controller: widget.controller,
              onChanged: (text) {
                var curr = widget.isNumInput;
                widget.isNumInput = text.isNotEmpty;
                if (curr != widget.isNumInput) {
                  setState(() {});
                }
                widget.textInput?.call(widget.index, text);
              },
              maxLength: 1,
              textAlign: TextAlign.center,
              strutStyle: const StrutStyle(
                  forceStrutHeight: true,
                  fontSize: 32,
                  leading: 0,
                  height: 1.1),
              style: const TextStyle(
                  fontSize: 32,
                  height: 2.0,
                  leadingDistribution: TextLeadingDistribution.even),
              cursorColor: Colors.transparent,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
            ),
          ],
        )));
  }
}
