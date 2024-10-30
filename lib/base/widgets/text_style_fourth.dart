import 'package:flutter/material.dart';

import '../res/styles/app_styles.dart';

class TextStyleForth extends StatelessWidget {
  final String text;
  final TextAlign alagn;
  const TextStyleForth({super.key, required this.text,  this.alagn = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alagn,
      style: AppStyles.headLineStyle4.copyWith(
        color: Colors.white,
      ),
    );
  }
}
