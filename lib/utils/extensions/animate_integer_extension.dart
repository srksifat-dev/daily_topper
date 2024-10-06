import 'package:flutter/material.dart';

extension AnimateInteger on Widget {
  Widget animateBetweenIntegers({
    required BuildContext context,
    required int start,
    required int end,
    required Duration duration,
  }) {
    return _AnimatedIntegerWidget(
      child: this,
      start: start,
      end: end,
      duration: duration,
    );
  }
}

class _AnimatedIntegerWidget extends StatefulWidget {
  final Widget child;
  final int start;
  final int end;
  final Duration duration;

  const _AnimatedIntegerWidget({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
    required this.duration,
  }) : super(key: key);

  @override
  _AnimatedIntegerWidgetState createState() => _AnimatedIntegerWidgetState();
}

class _AnimatedIntegerWidgetState extends State<_AnimatedIntegerWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = IntTween(begin: widget.start, end: widget.end).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _animation.value.toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        widget.child,
      ],
    );
  }
}