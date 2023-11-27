
import 'package:flutter/material.dart';
import 'package:interactive_care/core/styles/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMassage});

  final String errorMassage;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        errorMassage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
