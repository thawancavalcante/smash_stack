import 'package:flutter/material.dart';

class ScrollListErrorMessage extends StatelessWidget {
  const ScrollListErrorMessage({super.key, required this.error});

  final String error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        error,
        style: TextStyle(
          color: Theme.of(context).colorScheme.error,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
