import 'package:flutter/material.dart';

class IconToggle extends StatelessWidget {
  const IconToggle({
    super.key,
    required this.toggle,
    required this.iconOnTrue,
    required this.iconOnFalse,
    this.onTap,
  });
  final bool toggle;
  final Icon iconOnTrue;
  final Icon iconOnFalse;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: toggle ? iconOnTrue : iconOnFalse,
    );
  }
}
