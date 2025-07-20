import 'package:flutter/material.dart';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/gallery/dating_gallery_view.dart';

class DatingGallery extends StatefulWidget {
  final DatingModel dating;
  const DatingGallery({super.key, required this.dating});

  @override
  State<DatingGallery> createState() => _DatingGalleryState();
}

class _DatingGalleryState extends State<DatingGallery> {
  final PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildImage(String resource) {
    if (resource.startsWith('assets')) {
      return Image.asset(resource, fit: BoxFit.cover);
    } else {
      return Image.network(resource, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 如果你需要对齐逻辑
        children: [
          // Text('Gallery', style: Theme.of(context).textTheme.labelLarge),
          SizedBox(height: 8),
          Wrap(
            children: List.generate(
              widget.dating.photos.length,
              (index) => thumbnail(
                tag: "$index",
                resource: widget.dating.photos[index],
                onTap: () {
                  open(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                DatingGalleryView(dating: widget.dating, initialIndex: index),
      ),
    );
  }

  Widget thumbnail({onTap, required String tag, required String resource}) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0, bottom: 10),
      clipBehavior: Clip.hardEdge,
      height: 70,
      width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(tag: tag, child: _buildImage(resource)),
      ),
    );
  }
}
