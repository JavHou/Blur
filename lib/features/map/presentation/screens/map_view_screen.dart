import 'package:flutter/material.dart';
import 'package:blur/features/home/presentation/widgets/map/mapbox_view.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxView(),
    );
  }
}
