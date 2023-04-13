import 'package:flutter/material.dart';
import 'package:stint_app/core/constants/color_constants.dart';

class PageHeading extends StatelessWidget {
  final String text;
  const PageHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: ColorConstants.primary, fontSize: 24),
    );
  }
}
