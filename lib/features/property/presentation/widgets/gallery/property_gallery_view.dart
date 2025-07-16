import 'package:flutter/material.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PropertyGalleryView extends StatefulWidget {
  final PropertyModel property;
  final int initialIndex;
  const PropertyGalleryView({
    super.key,
    required this.property,
    this.initialIndex = 0,
  });

  @override
  State<PropertyGalleryView> createState() => _PropertyGalleryViewState();
}

class _PropertyGalleryViewState extends State<PropertyGalleryView> {
  late final PageController pageController;
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Gallery', style: theme.textTheme.labelLarge),
      ),
      body: Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.property.images[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 1,
              // heroAttributes: PhotoViewHeroAttributes(tag: currentIndex.toString()),
            );
          },
          itemCount: widget.property.images.length,
          loadingBuilder:
              (context, event) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value:
                        event == null
                            ? 0
                            : (event.cumulativeBytesLoaded /
                                (event.expectedTotalBytes ?? 1)),
                  ),
                ),
              ),
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          pageController: pageController,
          onPageChanged: onPageChanged,
        ),
      ),
    );
  }
}
