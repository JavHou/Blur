import 'package:flutter/material.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:blur/features/property/presentation/widgets/gallery/property_gallery_view.dart';

class PropertyGallery extends StatefulWidget {
  final PropertyModel property;
  const PropertyGallery({super.key, required this.property});

  @override
  State<PropertyGallery> createState() => _PropertyGalleryState();
}

class _PropertyGalleryState extends State<PropertyGallery> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gallery', style: Theme.of(context).textTheme.labelLarge),
        SizedBox(height: 8),
        Wrap(
          children: <Widget>[
            thumbnail(
              tag: "0",
              resource: widget.property.images[0],
              onTap: () {
                open(context, 0);
              },
            ),
            thumbnail(
              tag: "1",
              resource: widget.property.images[1],
              onTap: () {
                open(context, 1);
              },
            ),
            thumbnail(
              tag: "2",
              resource: widget.property.images[2],
              onTap: () {
                open(context, 2);
              },
            ),
          ],
        ),
      ],
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => PropertyGalleryView(
              property: widget.property,
              initialIndex: index,
            ),
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
        child: Hero(
          tag: tag,
          child: Image.network(resource, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
