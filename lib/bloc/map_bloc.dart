import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polyline_test/model/location_model.dart';
import 'map_event.dart';
import 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<LoadPolylineEvent>(_onLoadPolyline);
  }

  Future<void> _onLoadPolyline(
      LoadPolylineEvent event, Emitter<MapState> emit) async {
    final stopwatch = Stopwatch()..start();

    final jsonString =
        await rootBundle.loadString('assets/location/location_cordinate.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    final points = jsonMap.entries
        .map((e) => LocationPoint.fromJson(e.key, e.value).toLatLng())
        .toList(growable: false);
    final markers = points.asMap().entries.map((entry) {
      final index = entry.key;
      final point = entry.value;

      return Marker(
        markerId: MarkerId('marker_$index'),
        position: point,
        infoWindow: InfoWindow(title: 'Point $index'),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
      );
    }).toSet();
    emit(PolylineLoaded(points: points, markers: markers));

    stopwatch.stop();
    print('✅ Polyline loaded in ${stopwatch.elapsedMilliseconds} ms');
  }
}
