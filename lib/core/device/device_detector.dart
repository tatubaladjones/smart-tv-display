import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

enum DeviceType {
  firestick,
  androidTV,
  mobile,
  web,
  windows,
  unknown,
}

class DeviceDetector {
  static final DeviceDetector _instance = DeviceDetector._internal();
  static late DeviceType _cachedDeviceType;

  DeviceDetector._internal();

  factory DeviceDetector() {
    return _instance;
  }

  static Future<DeviceType> detectDevice() async {
    if (kIsWeb) {
      _cachedDeviceType = DeviceType.web;
      return DeviceType.web;
    }

    if (Platform.isWindows) {
      _cachedDeviceType = DeviceType.windows;
      return DeviceType.windows;
    }

    if (Platform.isAndroid) {
      return _detectAndroidDevice();
    }

    _cachedDeviceType = DeviceType.unknown;
    return DeviceType.unknown;
  }

  static Future<DeviceType> _detectAndroidDevice() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;

      if (_isFireStick(androidInfo)) {
        _cachedDeviceType = DeviceType.firestick;
        return DeviceType.firestick;
      }

      if (_isAndroidTV(androidInfo)) {
        _cachedDeviceType = DeviceType.androidTV;
        return DeviceType.androidTV;
      }

      _cachedDeviceType = DeviceType.mobile;
      return DeviceType.mobile;
    } catch (e) {
      _cachedDeviceType = DeviceType.unknown;
      return DeviceType.unknown;
    }
  }

  static bool _isFireStick(AndroidDeviceInfo info) {
    final model = info.model?.toUpperCase() ?? '';
    final manufacturer = info.manufacturer?.toUpperCase() ?? '';
    final brand = info.brand?.toUpperCase() ?? '';

    return model.contains('AFTM') ||
        model.contains('AFTT') ||
        model.contains('AFTM6') ||
        model.contains('AFTSC') ||
        manufacturer.contains('AMAZON') ||
        brand.contains('AMAZON') ||
        brand.contains('FIRESTICK');
  }

  static bool _isAndroidTV(AndroidDeviceInfo info) {
    final display = info.display?.toUpperCase() ?? '';
    final model = info.model?.toUpperCase() ?? '';
    final product = info.product?.toUpperCase() ?? '';

    return display.contains('TV') ||
        model.contains('TV') ||
        product.contains('TV') ||
        display.contains('ANDROID TV');
  }

  static DeviceType get currentDevice => _cachedDeviceType;

  static bool canAccessAdminPanel() {
    return _cachedDeviceType == DeviceType.web ||
        _cachedDeviceType == DeviceType.windows;
  }

  static bool isDisplayDevice() {
    return _cachedDeviceType == DeviceType.firestick ||
        _cachedDeviceType == DeviceType.androidTV;
  }

  static bool isMobile() {
    return _cachedDeviceType == DeviceType.mobile;
  }

  static String getDeviceDescription() {
    switch (_cachedDeviceType) {
      case DeviceType.firestick:
        return 'FireStick Amazon';
      case DeviceType.androidTV:
        return 'Android TV';
      case DeviceType.mobile:
        return 'Mobile';
      case DeviceType.web:
        return 'Web';
      case DeviceType.windows:
        return 'Windows';
      case DeviceType.unknown:
        return 'Desconhecido';
    }
  }
}
