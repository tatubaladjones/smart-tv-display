import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/theme/app_theme.dart';
import 'core/device/device_detector.dart';
import 'core/di/service_locator.dart';
import 'presentation/pages/home_page.dart';

future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Setup Service Locator
  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Detect device type
    final deviceType = await DeviceDetector.detectDevice();
    print('Device Type: $deviceType');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart TV Display',
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
