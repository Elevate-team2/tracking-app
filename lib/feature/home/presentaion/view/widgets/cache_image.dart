import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatelessWidget {
  final String imageUrl;
  const CacheImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey.shade200,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator(strokeWidth: 2)),
          errorWidget: (context, url, error) => Icon(
            Icons.image_not_supported_rounded,
            color: Colors.grey,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
