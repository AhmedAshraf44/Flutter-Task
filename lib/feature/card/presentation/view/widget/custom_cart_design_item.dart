import 'package:flutter/material.dart';
class CustomCartDesignItem extends StatelessWidget {
  const CustomCartDesignItem({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color:  Color(0xffD9D9D9),
              blurRadius: 8,
              spreadRadius: 3,
              offset: const Offset(0, 0))
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 22),
        child: widget,
      ),
    );
  }
}
