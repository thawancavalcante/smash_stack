import 'package:flutter/material.dart';
import 'package:smash/ui/pages/home/widgets/widgets.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.animationValue,
  });

  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Countries',
                style: TextStyle(fontSize: 26, height: .9),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text('Select a country'),
              )
            ],
          ),
          EarthAnimation(value: animationValue),
        ],
      ),
    );
  }
}
