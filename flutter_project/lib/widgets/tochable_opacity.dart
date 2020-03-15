import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final Function onPress;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;

  TouchableOpacity({ @required this.child, this.onPress });

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown;

  @override
  void initState() {
    super.initState();
    setState(() => isDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onPress,
      child: AnimatedOpacity(
        child: widget.child,
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
      ),
    );
  }
}