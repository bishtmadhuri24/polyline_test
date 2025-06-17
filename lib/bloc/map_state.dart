import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class PolylineLoaded extends MapState {
  final List<LatLng> points;
  final Set<Marker> markers;

  PolylineLoaded({required this.points, required this.markers});
}
