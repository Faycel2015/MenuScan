import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location.dart';
import '../models/nearby_restaurant.dart';

class PlacesServiceFree {
  static const String _overpassUrl = 'https://overpass-api.de/api/interpreter';
  static const String _nominatimUrl = 'https://nominatim.openstreetmap.org';
  static const String _userAgent = 'MenuScan/1.0';

  Future<List<NearbyRestaurant>> searchNearbyRestaurants({
    required LocationCoordinates location,
    int radius = 5000,
  }) async {
    try {
      final query = '''
        [out:json][timeout:25];
        (
          node["amenity"="restaurant"](around:$radius,${location.latitude},${location.longitude});
          node["amenity"="fast_food"](around:$radius,${location.latitude},${location.longitude});
          node["amenity"="cafe"](around:$radius,${location.latitude},${location.longitude});
        );
        out body;
      ''';

      final response = await http.post(
        Uri.parse(_overpassUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: 'data=$query',
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final elements = data['elements'] as List<dynamic>;
        final restaurants = <NearbyRestaurant>[];

        for (var element in elements) {
          if (element['type'] == 'node' && element['tags'] != null) {
            final restaurant = _parseOsmElement(element, location);
            if (restaurant != null) restaurants.add(restaurant);
          }
        }

        restaurants.sort((a, b) => (a.distanceKm ?? double.infinity)
            .compareTo(b.distanceKm ?? double.infinity));
        return restaurants;
      }
      throw PlacesException('Failed to fetch restaurants');
    } catch (e) {
      throw PlacesException('Search failed: $e');
    }
  }

  NearbyRestaurant? _parseOsmElement(
    Map<String, dynamic> element,
    LocationCoordinates userLocation,
  ) {
    final tags = element['tags'] as Map<String, dynamic>?;
    if (tags == null || tags['name'] == null) return null;

    final lat = element['lat'] as double;
    final lon = element['lon'] as double;
    final restaurantLocation = LocationCoordinates(latitude: lat, longitude: lon);
    final distance = userLocation.distanceTo(restaurantLocation);

    return NearbyRestaurant(
      id: element['id'].toString(),
      name: tags['name'] as String,
      location: restaurantLocation,
      address: _buildAddress(tags),
      distanceKm: distance,
    );
  }

  String? _buildAddress(Map<String, dynamic> tags) {
    final parts = <String>[];
    if (tags['addr:street'] != null) parts.add(tags['addr:street']);
    if (tags['addr:city'] != null) parts.add(tags['addr:city']);
    return parts.isEmpty ? null : parts.join(', ');
  }

  String? getPhotoUrl(String? photoReference) => null;
}

class PlacesException implements Exception {
  final String message;
  PlacesException(this.message);
  @override
  String toString() => message;
}
