import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageLoader {
  static Widget load({required String url,final double? width, final double? height, final BoxFit? fit}){
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit?? BoxFit.fill,
      placeholder: (context, url) => const SpinKitCircle(color: Colors.white,size: 22.0,),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}