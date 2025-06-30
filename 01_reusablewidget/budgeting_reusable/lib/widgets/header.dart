import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  //buat field dulu
  final String text;
  final EdgeInsetsGeometry padding;
  //masukan field di consrtructor !

  const Header({super.key, required this.text, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: const Color(0xFF606A85),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
