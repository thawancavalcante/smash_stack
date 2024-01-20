import 'package:flutter/material.dart';

class ScrollListLoading extends StatelessWidget {
  const ScrollListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
