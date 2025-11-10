import 'package:flutter/foundation.dart';
import '../../data/models/restaurant.dart';

class RestaurantProvider extends ChangeNotifier {
  final List<Restaurant> _restaurants = [];
  bool _isLoading = false;

  List<Restaurant> get restaurants => List.unmodifiable(_restaurants);
  bool get isLoading => _isLoading;
  bool get hasRestaurants => _restaurants.isNotEmpty;
  int get restaurantCount => _restaurants.length;

  Future<void> initialize() async {
    // Load from database in future
    notifyListeners();
  }

  Future<bool> addRestaurant(Restaurant restaurant) async {
    try {
      _isLoading = true;
      notifyListeners();
      _restaurants.add(restaurant);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> removeRestaurant(String id) async {
    _restaurants.removeWhere((r) => r.id == id);
    notifyListeners();
    return true;
  }

  Restaurant? getRestaurantById(String id) {
    try {
      return _restaurants.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }
}
