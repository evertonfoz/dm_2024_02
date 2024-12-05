import 'package:flutter/material.dart';

class TweenPageAnimation extends StatefulWidget {
  const TweenPageAnimation({super.key});

  @override
  _TweenPageAnimationState createState() => _TweenPageAnimationState();
}

class _TweenPageAnimationState extends State<TweenPageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double?> _animation;

  // late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 50, end: 100).animate(_controller);
    // _animation =
    //     ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: _animation.value,
              height: _animation.value,
              color: Colors.blue,
              // color: _animation.value,
            );
          },
        ),
      ),
    );
  }
}
