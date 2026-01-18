import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../repository/trip_repository.dart';
import '../view_model/trip_view_model.dart';
import '../models/trip_model.dart';

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepository();
});

final tripsProvider =
StateNotifierProvider<TripsViewModel, List<Trip>>((ref) {
  final repo = ref.read(tripRepositoryProvider);
  return TripsViewModel(repo);
});
