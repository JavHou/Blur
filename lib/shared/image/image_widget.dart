import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String imageUrl;
  const ImageWidget({super.key, required this.imageUrl});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      // fit: BoxFit.cover,
      imageUrl: widget.imageUrl,
      placeholder: (context, url) => Center(child: CircularProgressIndicator(
        color: Colors.black,
      )),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
