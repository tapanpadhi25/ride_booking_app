import '../models/trip_model.dart';
import '../models/ride_status.dart';
import '../services/hive_service.dart';

class TripRepository {
  List<Trip> getTrips() {
    return HiveService.trips.values.toList();
  }

  void addTrip(Trip trip) {
    HiveService.trips.put(trip.id, trip);
  }

  void updateStatus(String id, RideStatus status) {
    final trip = HiveService.trips.get(id);
    if (trip != null) {
      HiveService.trips.put(id, trip.copyWith(status: status));
    }
  }

  void deleteTrip(String id) {
    HiveService.trips.delete(id);
  }
}
