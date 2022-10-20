import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoader {
  static Widget load({required String url}){
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CircularProgressIndicator(
        color: Colors.black12,
        strokeWidth: 4.0,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}