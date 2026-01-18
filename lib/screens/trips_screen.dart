import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_booking_app/constants/strings_constant.dart';
import 'package:ride_booking_app/provider/trip_provider.dart';
import 'package:ride_booking_app/screens/add_trip_screen.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(tripsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.MY_TRIP,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (_, i) {
          final trip = trips[i];
          return ListTile(
            title: Text('${trip.pickupLocation} → ${trip.dropLocation}'),
            subtitle: Text(trip.status.name),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ref.read(tripsProvider.notifier).deleteTrip(trip.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTripScreen()),
          );
        },
        child:  Icon(Icons.add),
      ),
    );
  }
}
