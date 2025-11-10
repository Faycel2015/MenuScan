import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'presentation/providers/restaurant_provider.dart';
import 'presentation/providers/settings_provider.dart';
import 'presentation/providers/location_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final restaurantProvider = RestaurantProvider();
  final settingsProvider = SettingsProvider();
  final locationProvider = LocationProvider();

  await Future.wait([
    restaurantProvider.initialize(),
    settingsProvider.initialize(),
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: restaurantProvider),
        ChangeNotifierProvider.value(value: settingsProvider),
        ChangeNotifierProvider.value(value: locationProvider),
      ],
      child: const MenuScanApp(),
    ),
  );
}
