import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class PolylineLoaded extends MapState {
  final List<LatLng> points;
  final List<CircleMarker> circles;

  PolylineLoaded({required this.points, required this.circles});
}

class MapError extends MapState {
  final String message;
  MapError(this.message);
}
