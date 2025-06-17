import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPoint {
  final String id;
  final String accuracy;
  final String age;
  final String altitude;
  final String batteryPercentage;
  final String deviceInfo;
  final String deviceTimestamp;
  final String event;
  final String geoAddress;
  final String geoLat;
  final String geoLong;
  // final double odometer;
  final bool sample;
  final String source;
  final String speed;
  final String speedAccuracy;
  final String timestamp;

  LocationPoint({
    required this.id,
    required this.accuracy,
    required this.age,
    required this.altitude,
    required this.batteryPercentage,
    required this.deviceInfo,
    required this.deviceTimestamp,
    required this.event,
    required this.geoAddress,
    required this.geoLat,
    required this.geoLong,
    //  required this.odometer,
    required this.sample,
    required this.source,
    required this.speed,
    required this.speedAccuracy,
    required this.timestamp,
  });

  factory LocationPoint.fromJson(String id, Map<String, dynamic> json) {
    return LocationPoint(
      id: id,
      accuracy: json['accuracy'] ?? '',
      age: json['age'] ?? '',
      altitude: json['altitude'] ?? '',
      batteryPercentage: json['battery_percentage'] ?? '',
      deviceInfo: json['deviceInfo'] ?? '',
      deviceTimestamp: json['deviceTimestamp'] ?? '',
      event: json['event'] ?? '',
      geoAddress: json['geo_address'] ?? '',
      geoLat: json['geo_lat'] ?? '',
      geoLong: json['geo_long'] ?? '',
      // odometer: (json['odometer'] ?? 0).toDouble(),
      sample: json['sample'] ?? false,
      source: json['source'] ?? '',
      speed: json['speed'] ?? '',
      speedAccuracy: json['speedAccuracy'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }
  LatLng toLatLng() {
    return LatLng(double.parse(geoLat), double.parse(geoLong));
  }
}
