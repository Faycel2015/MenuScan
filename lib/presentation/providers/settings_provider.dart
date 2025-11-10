import 'package:flutter/foundation.dart';

class SettingsProvider extends ChangeNotifier {
  String _language = 'English';
  String _currency = 'USD';
  bool _notificationsEnabled = true;

  String get language => _language;
  String get currency => _currency;
  bool get notificationsEnabled => _notificationsEnabled;

  Future<void> initialize() async {
    notifyListeners();
  }

  Future<void> setLanguage(String language) async {
    _language = language;
    notifyListeners();
  }

  Future<void> setCurrency(String currency) async {
    _currency = currency;
    notifyListeners();
  }

  Future<void> toggleNotifications(bool enabled) async {
    _notificationsEnabled = enabled;
    notifyListeners();
  }
}
