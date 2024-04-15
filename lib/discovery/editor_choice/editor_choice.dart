//     @Description
//     @Author zhongzusheng
//     @date 2024_04_12

import 'package:flutter/cupertino.dart';

class EditorChoiceWidget extends StatelessWidget {
  const EditorChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: [Text("编辑精选")],
        ));
  }
}
