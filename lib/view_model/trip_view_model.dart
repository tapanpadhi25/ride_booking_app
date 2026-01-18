import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';
import 'package:ride_booking_app/services/ride_status_simulator.dart';
import '../models/trip_model.dart';
import '../models/ride_status.dart';
import '../repository/trip_repository.dart';

class TripsViewModel extends StateNotifier<List<Trip>> {
  final TripRepository repository;
  final Map<String, StreamSubscription> _subscriptions = {};
  TripsViewModel(this.repository) : super([]) {
    loadTrips();
  }

  void loadTrips() {
    state = repository.getTrips();
  }

  void addTrip(Trip trip) {
    repository.addTrip(trip);
    loadTrips();
    _startSimulation(trip.id);
  }
  void _startSimulation(String tripId){
    _subscriptions[tripId]?.cancel();
    _subscriptions[tripId] =
        RideStatusSimulator.simulate().listen((status){
          repository.updateStatus(tripId, status);
          loadTrips();
        });
  }


  void updateTripStatus(String id, RideStatus status) {
    repository.updateStatus(id, status);
    loadTrips();
  }

  void deleteTrip(String id) {
    _subscriptions[id]?.cancel();
    _subscriptions.remove(id);
    repository.deleteTrip(id);
    loadTrips();
  }
  @override
  void dispose() {
    for (var sub in _subscriptions.values) {
      sub.cancel();
    }
    super.dispose();
  }
}
