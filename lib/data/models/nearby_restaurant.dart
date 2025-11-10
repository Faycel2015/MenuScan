import 'location.dart';

class NearbyRestaurant {
  final String id;
  final String name;
  final LocationCoordinates location;
  final String? address;
  final String? phone;
  final double? distanceKm;

  NearbyRestaurant({
    required this.id,
    required this.name,
    required this.location,
    this.address,
    this.phone,
    this.distanceKm,
  });

  String get formattedDistance {
    if (distanceKm == null) return '';
    if (distanceKm! < 1) {
      return '${(distanceKm! * 1000).toStringAsFixed(0)} m';
    }
    return '${distanceKm!.toStringAsFixed(1)} km';
  }
}
