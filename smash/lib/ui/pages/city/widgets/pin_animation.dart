import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PinAnimation extends StatefulWidget {
  const PinAnimation({super.key});

  @override
  State<PinAnimation> createState() => PinAnimationState();
}

class PinAnimationState extends State<PinAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addListener(() {
      const double maxDuration = .7;
      if (_controller.value > maxDuration) {
        _controller.value = maxDuration;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<LottieComposition?> customDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.firstWhere((f) {
        return f.name.startsWith('animations/') && f.name.endsWith('.json');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Lottie.asset(
        'lib/ui/assets/animations/pin.lottie',
        controller: _controller,
        onLoaded: (comp) {
          _controller
            ..duration = comp.duration
            ..forward();
        },
        decoder: customDecoder,
        alignment: Alignment.centerRight,
        fit: BoxFit.cover,
        width: 210,
      ),
    );
  }
}
