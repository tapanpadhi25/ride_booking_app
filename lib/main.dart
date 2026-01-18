import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ride_booking_app/models/ride_status.dart';
import 'package:ride_booking_app/models/ride_type.dart';
import 'package:ride_booking_app/models/trip_model.dart';
import 'package:ride_booking_app/provider/theme_provider.dart';
import 'package:ride_booking_app/screens/dashboard_screen.dart';

import 'constants/custom_theme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TripAdapter());
  Hive.registerAdapter(RideStatusAdapter());
  Hive.registerAdapter(RideTypeAdapter());
  await Hive.openBox<Trip>('trips');
  runApp(ProviderScope(
      child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: themeMode,
      home: const DashboardScreen(),
    );
  }
}
