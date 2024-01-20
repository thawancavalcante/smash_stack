import 'package:flutter/material.dart';

final class ScrollListEmptyState extends StatelessWidget {
  const ScrollListEmptyState({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        label ?? 'No item found',
        textAlign: TextAlign.center,
      ),
    );
  }
}
