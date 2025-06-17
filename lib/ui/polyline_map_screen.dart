import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import '../bloc/map_bloc.dart';
import '../bloc/map_event.dart';
import '../bloc/map_state.dart';

class PolylineMapScreen extends StatefulWidget {
  @override
  State<PolylineMapScreen> createState() => _PolylineMapScreenState();
}

class _PolylineMapScreenState extends State<PolylineMapScreen> {
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
              return FlutterMap(
                options: MapOptions(
                  initialCenter: state.points.first,
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: state.points,
                        strokeWidth: 4.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: state.points.map((point) {
                      return Marker(
                        width: 40,
                        height: 40,
                        point: point,
                        child: const Icon(Icons.location_on, color: Colors.red),
                      );
                    }).toList(),
                  ),
                  CircleLayer(
                    circles: state.circles,
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
