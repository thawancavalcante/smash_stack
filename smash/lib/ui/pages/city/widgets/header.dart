import 'package:flutter/material.dart';
import 'package:smash/ui/pages/city/widgets/widgets.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.animationValue,
    required this.countryName,
  });

  final String countryName;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: double.maxFinite,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryName,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 26, height: .9),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text('Cities'),
                    )
                  ],
                ),
              ),
              const PinAnimation()
            ],
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
