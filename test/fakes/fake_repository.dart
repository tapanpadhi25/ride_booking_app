import 'package:ride_booking_app/models/ride_status.dart';
import 'package:ride_booking_app/models/trip_model.dart';
import 'package:ride_booking_app/repository/trip_repository.dart';

class FakeTripRepository implements TripRepository {
  @override
  Future<List<Trip>> fetchTrips() async {
    return [];
  }

  @override
  void addTrip(Trip trip) {
    // TODO: implement addTrip
  }

  @override
  void deleteTrip(String id) {
    // TODO: implement deleteTrip
  }

  @override
  List<Trip> getTrips() {
    // TODO: implement getTrips
    throw UnimplementedError();
  }

  @override
  void updateStatus(String id, RideStatus status) {
    // TODO: implement updateStatus
  }
}
