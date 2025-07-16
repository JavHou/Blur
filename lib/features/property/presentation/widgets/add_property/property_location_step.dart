import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/app/constants.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PropertyLocationStep extends StatefulWidget {
  const PropertyLocationStep({Key? key}) : super(key: key);

  @override
  State<PropertyLocationStep> createState() => _PropertyLocationStepState();
}

class _PropertyLocationStepState extends State<PropertyLocationStep> {
  late MapboxMap mapboxMap;
  String? foundPlaceName;

  final TextEditingController _searchController = TextEditingController();

  String mapboxToken = AppConstants.mapboxToken;

  Future<void> _onMapCreated(MapboxMap createdMap) async {
    MapboxOptions.setAccessToken(mapboxToken);
    mapboxMap = createdMap;

    // Add a marker at the center of the map
    _searchLocation("San Francisco");
  }

  Future<void> _searchLocation(String query) async {
    if (query.isEmpty) return;

    // Example Mapbox forward geocoding request:
    final url = Uri.parse(
      "https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json?access_token=$mapboxToken",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["features"] != null && data["features"].isNotEmpty) {
        final feature = data["features"][0];
        final placeName = feature["place_name"];
        final coords = feature["geometry"]["coordinates"];
        final lng = coords[0];
        final lat = coords[1];

        // Move camera to this location
        mapboxMap.flyTo(
          CameraOptions(
            center: Point(coordinates: Position(lng, lat)),
            zoom: 14,
          ),
          MapAnimationOptions(duration: 1000),
        );

        // Show marker at this location
        _addMarkerToMap(lng, lat);
        setState(() {
          foundPlaceName = placeName;
        });

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Found: $placeName")));
      }
    }
  }

  void _addMarkerToMap(num lng, num lat) async {
    final annotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    final ByteData bytes = await rootBundle.load('assets/icons/pointer-2.png');
    final Uint8List imageData = bytes.buffer.asUint8List();

    await annotationManager.create(
      PointAnnotationOptions(
        geometry: Point(coordinates: Position(lng, lat)),
        iconSize: 0.2,
        image: imageData,
        iconAnchor: IconAnchor.BOTTOM,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Select Property Location',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Let us know where your property is located. This will help us find the best match for you.",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: HugeIcon(
                        icon: HugeIcons.bulkRoundedLocation01,
                        color: Colors.black,
                      ),
                      hintText: "Search location...",
                    ),
                    onSubmitted: _searchLocation,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.grey.shade200,
                    ),
                  ),
                  icon: HugeIcon(
                    icon: HugeIcons.bulkRoundedSearch01,
                    color: Colors.black,
                  ),
                  onPressed: () => _searchLocation(_searchController.text),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
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
                styleUri: AppConstants.mapboxStyleID,
                onMapCreated: _onMapCreated,
                onTapListener: (MapContentGestureContext c) {
                  _addMarkerToMap(
                    c.point.coordinates.lng,
                    c.point.coordinates.lat,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.orange),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    foundPlaceName ?? "",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
