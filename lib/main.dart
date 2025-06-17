import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/map_bloc.dart';
import 'ui/polyline_map_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlocProvider(
      create: (_) => MapBloc(),
      child: PolylineMapScreen(),
    ),
  ));
}
