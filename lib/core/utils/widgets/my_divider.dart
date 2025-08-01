import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
    this.top,
  });
  final double? top;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: top ?? 24),
      child: Divider(
        color: Color(0xffD9D9D9),
      ),
    );
  }
}
