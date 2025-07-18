import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blur/app/constants.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class DatingLocation extends StatefulWidget {
  const DatingLocation({super.key});

  @override
  State<DatingLocation> createState() => _DatingLocationState();
}

class _DatingLocationState extends State<DatingLocation> {
  late MapboxMap mapboxMap;
  String? foundPlaceName;

  String mapboxToken = AppConstants.mapboxToken;

  Future<void> _onMapCreated(MapboxMap createdMap) async {
    MapboxOptions.setAccessToken(mapboxToken);
    mapboxMap = createdMap;

    _addMarkerToMap(-122.433135, 37.785160);
  }

  void _addMarkerToMap(num lng, num lat) async {
    final annotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    final ByteData bytes = await rootBundle.load('assets/icons/pointer-3.webp');
    final Uint8List imageData = bytes.buffer.asUint8List();

    await annotationManager.create(
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(lng, lat)),
        iconSize: 0.12,
        image: imageData,
        iconAnchor: IconAnchor.BOTTOM,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text('地点', style: theme.textTheme.labelLarge),
        SizedBox(height: 8),
        Container(
          height: 200,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: MapWidget(
            key: const ValueKey("mapWidget"),
            cameraOptions: CameraOptions(
              center: Point(coordinates: Position(-122.433135, 37.785160)),
              zoom: 14,
            ),
            // styleUri: AppConstants.mapboxStyleID,
            onMapCreated: _onMapCreated,
            onTapListener: (MapContentGestureContext c) {
              _addMarkerToMap(c.point.coordinates.lng, c.point.coordinates.lat);
            },
          ),
        ),
        // Container(
        //   height: 160,
        //   padding: EdgeInsets.all(16),
        //   decoration: BoxDecoration(
        //     color: Colors.grey.shade200,
        //     borderRadius: BorderRadius.circular(16),
        //   ),
        //   child: Row(
        //     children: [
        //       Icon(Icons.location_on, color: Colors.black),
        //       SizedBox(width: 8),
        //       Expanded(
        //         child: Text(
        //           '123 Main St, Springfield, USA',
        //           // style: theme.textTheme.bodyText1,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
