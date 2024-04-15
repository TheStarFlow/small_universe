//     @Description
//     @Author zhongzusheng
//     @date 2024_04_11

import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SubscriptionState();
  }
}

class _SubscriptionState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    print("=========> 订阅页面,build");
    return const Text("订阅页面");
  }
}
