import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../device/device_detector.dart';
import '../storage/hive_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Device
  getIt.registerSingleton<DeviceDetector>(DeviceDetector());

  // Storage
  getIt.registerSingletonAsync<HiveService>(() async {
    final hiveService = HiveService();
    await hiveService.init();
    return hiveService;
  });

  // Network
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        validateStatus: (status) => status != null && status < 500,
      ),
    ),
  );
}
