//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'package:flutter/material.dart';
import 'package:small_universe/discovery/editor_choice/editor_choice.dart';
import 'package:small_universe/discovery/search_bar/search_bar.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiscoveryState();
  }
}

class _DiscoveryState extends State<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    print("=========> 发现页面,build");
    return Expanded(
        child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return _getWidgetByIndex(context, index);
                  }),
            )));
  }

  Future _onRefresh() async {
    /// todo 等待实现
  }

  Widget? _getWidgetByIndex(BuildContext context, int index) {
    print("====== >>  build index $index");
    switch (index) {
      case 0:
        return SearchBarWidget();
      case 1:
        return const EditorChoiceWidget();
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      default:
        return null;
    }
  }
}
