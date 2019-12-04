import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color background;
  final bool isFeed;

  TouchCallBack(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.background: const Color(0xffd8d8),
      this.isFeed})
      : super(key: key);

  @override
  _TouchCallBackState createState() => _TouchCallBackState();
}

class _TouchCallBackState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 使用 Container 包裹 child
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (_) {
        if (widget.isFeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      onPanCancel: (){
        setState(() {
          color = color;
        });
      },
    );
  }
}
