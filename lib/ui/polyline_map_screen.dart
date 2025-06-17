import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../bloc/map_bloc.dart';
import '../bloc/map_event.dart';
import '../bloc/map_state.dart';

class PolylineMapScreen extends StatefulWidget {
  @override
  State<PolylineMapScreen> createState() => _PolylineMapScreenState();
}

class _PolylineMapScreenState extends State<PolylineMapScreen> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    context.read<MapBloc>().add(LoadPolylineEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Polyline Route')),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is PolylineLoaded) {
            final polyline = Polyline(
              polylineId: PolylineId("route"),
              color: Colors.blue,
              width: 4,
              points: state.points,
            );

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: state.points.first,
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              polylines: {polyline},
              markers: state.markers,
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
