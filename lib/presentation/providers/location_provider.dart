import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import '../../data/models/location.dart';
import '../../data/models/nearby_restaurant.dart';
import '../../data/services/location_service.dart';
import '../../data/services/places_service_free.dart';

class LocationProvider extends ChangeNotifier {
  final LocationService _locationService = LocationService();
  final PlacesServiceFree _placesService = PlacesServiceFree();

  LocationCoordinates? _currentLocation;
  List<NearbyRestaurant> _nearbyRestaurants = [];
  bool _isLoadingLocation = false;
  bool _isLoadingRestaurants = false;
  String? _error;
  int _searchRadius = 5000;

  LocationCoordinates? get currentLocation => _currentLocation;
  List<NearbyRestaurant> get nearbyRestaurants => List.unmodifiable(_nearbyRestaurants);
  bool get isLoadingLocation => _isLoadingLocation;
  bool get isLoadingRestaurants => _isLoadingRestaurants;
  String? get error => _error;
  bool get hasLocation => _currentLocation != null;

  Future<bool> getCurrentLocation() async {
    try {
      _isLoadingLocation = true;
      _error = null;
      notifyListeners();

      _currentLocation = await _locationService.getCurrentLocation();
      _isLoadingLocation = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoadingLocation = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> findNearbyRestaurants() async {
    if (_currentLocation == null) return;

    try {
      _isLoadingRestaurants = true;
      notifyListeners();

      _nearbyRestaurants = await _placesService.searchNearbyRestaurants(
        location: _currentLocation!,
        radius: _searchRadius,
      );

      _isLoadingRestaurants = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to find restaurants: $e';
      _isLoadingRestaurants = false;
      notifyListeners();
    }
  }

  Future<LocationPermission> checkPermission() async {
    return await _locationService.checkPermission();
  }

  Future<LocationPermission> requestPermission() async {
    return await _locationService.requestPermission();
  }

  Future<bool> openLocationSettings() async {
    return await _locationService.openLocationSettings();
  }

  Future<void> refresh() async {
    await getCurrentLocation();
    if (_currentLocation != null) {
      await findNearbyRestaurants();
    }
  }
}
