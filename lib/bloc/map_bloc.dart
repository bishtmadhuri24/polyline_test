import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:polyline_test/bloc/map_event.dart';
import 'package:polyline_test/model/location_model.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapsEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<LoadPolylineEvent>(onLoadPolyline);
  }
  Future<void> onLoadPolyline(
      LoadPolylineEvent event, Emitter<MapState> emit) async {
    final jsonString =
        await rootBundle.loadString('assets/location/location_cordinate.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final entries = jsonMap.entries.toList()
      ..sort((a, b) => DateTime.parse(a.value['timestamp'] ?? '')
          .compareTo(DateTime.parse(b.value['timestamp'] ?? '')));

    final locationPoints =
        entries.map((e) => LocationPoint.fromJson(e.key, e.value)).toList();

    final points = locationPoints.map((e) => e.toLatLng()).toList();

    final circles = locationPoints.map((point) {
      final accuracy = double.tryParse(point.accuracy) ?? 0;
      return CircleMarker(
        point: point.toLatLng(),
        color: Colors.blue.withOpacity(0.2),
        borderStrokeWidth: 1,
        borderColor: Colors.blue,
        radius: accuracy,
        useRadiusInMeter: true,
      );
    }).toList();

    emit(PolylineLoaded(points: points, circles: circles));
  }
}
