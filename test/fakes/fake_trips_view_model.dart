import 'package:ride_booking_app/models/ride_status.dart';
import 'package:ride_booking_app/models/ride_type.dart';
import 'package:ride_booking_app/models/trip_model.dart';
import 'package:ride_booking_app/view_model/trip_view_model.dart';

import 'fake_repository.dart';

class FakeTripsViewModel extends TripsViewModel {
  FakeTripsViewModel() : super(FakeTripRepository());

  @override
  void loadTrips() {
    state = [
      Trip(
        id: '1',
        status: RideStatus.completed,
        pickupLocation: 'Silk Board',
        dropLocation: 'BTM Layout',
        rideType: RideType.mini,
        fare: 100,
        dateTime: DateTime.now(),
      ),
    ];
  }

  @override
  void addTrip(Trip trip) {
    state = [...state, trip];
  }

  @override
  void deleteTrip(String id) {
    state = state.where((t) => t.id != id).toList();
  }

  @override
  void updateTripStatus(String id, RideStatus status) {
    state = [
      for (final trip in state)
        if (trip.id == id)
          trip.copyWith(status: status)
        else
          trip
    ];
  }
}
