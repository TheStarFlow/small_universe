//     @Description
//     @Author zhongzusheng
//     @date 2024_03_27

import 'package:flutter/material.dart';

class ImagePositionBox extends StatefulWidget {
  final double width;
  final double height;
  String? image;
  double? start = 0;
  double? end = 0;
  late AnimationController controller;

  ImagePositionBox(this.width, this.height,
      {this.image, this.start, this.end, required this.controller, super.key});

  @override
  State<StatefulWidget> createState() => _ImagePositionBoxSate(controller);
}

class _ImagePositionBoxSate extends State<ImagePositionBox>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController controller;

  Offset currOffset = const Offset(0, 0);

  _ImagePositionBoxSate(this.controller);

  @override
  void initState() {
    super.initState();

    var ts = TweenSequence([
      TweenSequenceItem(
          tween: Tween(
                  begin: Offset(0, widget.start ?? 0), end: const Offset(0, 0))
              .chain(CurveTween(curve: Curves.easeOutCirc)),
          weight: 3000),
      TweenSequenceItem(
          tween: Tween(begin: const Offset(0, 0), end: const Offset(0, 0)),
          weight: 1500),
      TweenSequenceItem(
          tween:
              Tween(begin: const Offset(0, 0), end: Offset(0, widget.end ?? 0))
                  .chain(CurveTween(curve: Curves.easeInOutQuart)),
          weight: 2000)
    ]);
    animation = ts.animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: SlideTransition(
          position: animation,
          child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(3)),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                "images/${widget.image}",
                fit: BoxFit.fill,
              )),
        ));
  }
}
