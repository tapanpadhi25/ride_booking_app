import 'package:flutter_test/flutter_test.dart';
import 'package:ride_booking_app/models/ride_status.dart';
import 'package:ride_booking_app/services/ride_status_simulator.dart';
void main() {
  test('Ride status progresses in correct order', () async {
    final stream = RideStatusSimulator.simulate();

    await expectLater(
      stream,
      emitsInOrder([
        RideStatus.driverAssigned,
        RideStatus.rideStarted,
        RideStatus.completed,
      ]),
    );
  });
}
