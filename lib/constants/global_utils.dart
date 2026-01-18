import 'package:flutter/material.dart';
import 'package:ride_booking_app/models/ride_status.dart';

Color statusColor(RideStatus status) {
  switch (status) {
    case RideStatus.requested:
      return Colors.grey.shade300;
    case RideStatus.driverAssigned:
      return Colors.orange.shade300;
    case RideStatus.rideStarted:
      return Colors.blue.shade300;
    case RideStatus.completed:
      return Colors.green.shade300;
    default:
      return Colors.red.shade300;
  }
}
