import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DatingGalleryView extends StatefulWidget {
  final DatingModel dating;
  final int initialIndex;
  const DatingGalleryView({
    super.key,
    required this.dating,
    this.initialIndex = 0,
  });

  @override
  State<DatingGalleryView> createState() => _DatingGalleryViewState();
}

class _DatingGalleryViewState extends State<DatingGalleryView> {
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
              imageProvider: NetworkImage(widget.dating.photos[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 1,
              // heroAttributes: PhotoViewHeroAttributes(tag: currentIndex.toString()),
            );
          },
          itemCount: widget.dating.photos.length,
          loadingBuilder:
              (context, event) => Center(
                child: SizedBox(
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
