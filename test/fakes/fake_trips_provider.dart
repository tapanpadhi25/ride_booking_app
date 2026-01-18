import 'package:flutter_riverpod/legacy.dart';
import 'package:ride_booking_app/models/trip_model.dart';
import 'package:ride_booking_app/provider/trip_provider.dart';
import 'package:ride_booking_app/view_model/trip_view_model.dart';

final tripsProvider =
StateNotifierProvider<TripsViewModel, List<Trip>>(
      (ref) => TripsViewModel(ref.read(tripRepositoryProvider)),
);
