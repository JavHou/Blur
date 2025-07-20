import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String imageUrl;
  // final bool isAsset; // 添加标识是否为本地资源

  const ImageWidget({
    super.key,
    required this.imageUrl,
    // this.isAsset = false, // 默认为网络图片
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    // 自动判断是否为本地资源
    final bool isAsset = widget.imageUrl.startsWith('assets');

    // 如果是本地资源，使用AssetImage
    if (isAsset) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(widget.imageUrl), // 使用AssetImage
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // 网络图片继续使用CachedNetworkImage
    return CachedNetworkImage(
      imageBuilder:
          (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
      imageUrl: widget.imageUrl,
      placeholder:
          (context, url) =>
              Center(child: CircularProgressIndicator(color: Colors.black)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
