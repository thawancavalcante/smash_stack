import 'package:flutter/material.dart';

class CustomModal {
  static Future<void> showBottomSheet(
    BuildContext context, {
    String? title,
    required Widget Function(BuildContext) builder,
  }) async {
    return showModalBottomSheet<void>(
      useRootNavigator: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 69,
                height: 6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                ),
              ),
            ),
            builder(context),
          ],
        );
      },
    );
  }
}
