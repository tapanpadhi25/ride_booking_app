import 'package:flutter_riverpod/legacy.dart';
import '../models/trip_model.dart';
import '../models/ride_status.dart';
import '../repository/trip_repository.dart';

class TripsViewModel extends StateNotifier<List<Trip>> {
  final TripRepository repository;

  TripsViewModel(this.repository) : super([]) {
    loadTrips();
  }

  void loadTrips() {
    state = repository.getTrips();
  }

  void addTrip(Trip trip) {
    repository.addTrip(trip);
    loadTrips();
  }

  void updateTripStatus(String id, RideStatus status) {
    repository.updateStatus(id, status);
    loadTrips();
  }

  void deleteTrip(String id) {
    repository.deleteTrip(id);
    loadTrips();
  }
}
