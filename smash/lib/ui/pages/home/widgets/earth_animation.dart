import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smash/ui/utils/utils.dart';

class EarthAnimation extends StatefulWidget {
  const EarthAnimation({
    super.key,
    this.value = 0,
  });

  final double value;

  @override
  State<EarthAnimation> createState() => _EarthAnimationState();
}

class _EarthAnimationState extends State<EarthAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      setState(() {
        _controller.value = widget.value;
      });
    }

    return Flexible(
      child: Lottie.asset(
        'lib/ui/assets/animations/earth.lottie',
        decoder: customDecoder,
        animate: false,
        controller: _controller,
        onLoaded: (composition) {
          setState(() {
            _controller.duration = composition.duration;
            loaded = true;
          });
        },
        alignment: Alignment.centerRight,
        fit: BoxFit.cover,
        width: 200,
      ),
    );
  }
}
