import 'dart:async';
import '../models/ride_status.dart';

class RideStatusSimulator {
  static Stream<RideStatus> simulate() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield RideStatus.driverAssigned;

    await Future.delayed(const Duration(seconds: 3));
    yield RideStatus.rideStarted;

    await Future.delayed(const Duration(seconds: 4));
    yield RideStatus.completed;
  }
}
