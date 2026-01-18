import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/dash_board_state.dart';
import '../models/trip_model.dart';
import '../models/ride_status.dart';

class DashboardViewModel extends StateNotifier<DashboardState> {
  DashboardViewModel() : super(DashboardState.initial()) {
    _startLiveStream();
  }

  void updateTrips(List<Trip> trips) {
    final completed =
        trips.where((e) => e.status == RideStatus.completed).length;
    final cancelled =
        trips.where((e) => e.status == RideStatus.cancelled).length;

    final Map<String, int> driverMap = {};
    for (final t in trips) {
      driverMap[t.id] = (driverMap[t.id] ?? 0) + 1;
    }

    state = DashboardState(
      totalTrips: trips.length,
      completedTrips: completed,
      cancelledTrips: cancelled,
      driverTrips: driverMap,
      liveTripCount: state.liveTripCount,
    );
  }

  void _startLiveStream() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      final updated = List<int>.from(state.liveTripCount)
        ..add(state.totalTrips);

      if (updated.length > 20) {
        updated.removeAt(0);
      }

      state = DashboardState(
        totalTrips: state.totalTrips,
        completedTrips: state.completedTrips,
        cancelledTrips: state.cancelledTrips,
        driverTrips: state.driverTrips,
        liveTripCount: updated,
      );
    });
  }
}
