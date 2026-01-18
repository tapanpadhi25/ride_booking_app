import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:ride_booking_app/provider/trip_provider.dart';

import '../models/dash_board_state.dart';
import '../models/ride_status.dart';
import '../view_model/dashboard_viewmodel.dart';

final dashboardProvider =
StateNotifierProvider<DashboardViewModel, DashboardState>(
        (ref) => DashboardViewModel());

final liveTripsCountProvider = Provider<List<int>>((ref) {
  final trips = ref.watch(tripsProvider);

  // simulate timeline points
  final completed = trips.where((t) => t.status == RideStatus.completed).length;
  final started = trips.where((t) => t.status == RideStatus.rideStarted).length;
  final assigned = trips.where((t) => t.status == RideStatus.driverAssigned).length;

  return [assigned, started, completed];
});
final driverTripsProvider = Provider<Map<String, int>>((ref) {
  final trips = ref.watch(tripsProvider);

  final Map<String, int> data = {};
  for (final t in trips) {
    data[t.id] = (data[t.id] ?? 0) + 1;
  }
  return data;
});

final rideStatusPieProvider = Provider<Map<RideStatus, int>>((ref) {
  final trips = ref.watch(tripsProvider);

  final Map<RideStatus, int> map = {};
  for (final t in trips) {
    map[t.status] = (map[t.status] ?? 0) + 1;
  }
  return map;
});

