import 'package:flutter/material.dart';

class FadeText extends StatelessWidget {
  const FadeText({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: const Text(
            'Country’s one of the most prominent virtual platforms for providing academic, career & skill development',
            style: TextStyle(
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
