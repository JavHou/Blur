import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/app/constants.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapboxView extends StatefulWidget {
  const MapboxView({super.key});

  @override
  State<MapboxView> createState() => _MapboxViewState();
}

class _MapboxViewState extends State<MapboxView> {
  late MapboxMap mapboxMap;
  String mapboxToken = AppConstants.mapboxToken;

  Future<void> _onMapCreated(MapboxMap createdMap) async {
    MapboxOptions.setAccessToken(mapboxToken);
    mapboxMap = createdMap;

    initialProperties();
  }

  void initialProperties() async {
    final annotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    final ByteData bytes = await rootBundle.load('assets/icons/pointer-3.webp');
    final Uint8List imageData = bytes.buffer.asUint8List();

    await annotationManager.createMulti([
      for (var property in properties)
        PointAnnotationOptions(
          geometry: Point(coordinates: Position(property.longitude, property.latitude)),
          iconSize: 0.1,
          image: imageData,
          iconAnchor: IconAnchor.BOTTOM,
          textAnchor: TextAnchor.TOP,
          textField: property.title,
          textColor: 0xffffffff,
          textSize: 12,
          textOffset: [0, 1.1],
          
          // userData: property,
        ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        MapWidget(
          key: const ValueKey("mapWidget"),
          cameraOptions: CameraOptions(
            center: Point(coordinates: Position(-122.433135, 37.785160)),
            zoom: 14,
          ),
          styleUri: AppConstants.mapboxStyleID,
          onMapCreated: _onMapCreated,
          onTapListener: (MapContentGestureContext c) {
            // _addMarkerToMap(c.point.coordinates.lng, c.point.coordinates.lat);
          },
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(top: 70, bottom: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  Colors.black.withAlpha(200),
                  Colors.black.withAlpha(100),
                  Colors.black.withAlpha(10),
                ],
              )
            ),
            child: Row(
              children: [
                BackButton(color: Colors.white,),
                const SizedBox(width: 16),
                Text(
                  "Map View",
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: HugeIcon(icon: HugeIcons.bulkRoundedSearch01, color: Colors.white),
                  onPressed: () {
                    // Add your action here
                  },
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: HugeIcon(icon: HugeIcons.bulkRoundedFilter, color: Colors.white),
                  onPressed: () {
                    // Add your action here
                  },
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            padding: EdgeInsets.only(bottom: 80, top: 20, left: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(10),
                  Colors.black.withAlpha(100),
                  Colors.black.withAlpha(200),
                ],
              )
            ),
            child: properties.isNotEmpty ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: properties.length,
              itemBuilder: (_, index) {
                return AspectRatio(
                  aspectRatio: 3,
                  child: InkWell(
                    onTap: () {
                      context.push('/property/${properties[index].id}/view', extra: properties[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              properties[index].coverImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(properties[index].title, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.labelLarge),
                                const SizedBox(height: 4),
                                Text(properties[index].address, style: theme.textTheme.labelMedium),
                                Spacer(),
                                Text(
                                  "\$${properties[index].rentPrice} / month",
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ) : null
          ),
        ),
      ],
    );
  }
}
