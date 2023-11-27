import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, this.borderRadius, required this.imageURL});

  final String imageURL;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.5 / 2,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageURL,
          errorWidget: (context, url, error) => const Icon(Icons.error),

        ),
      ),
    );
  }
}