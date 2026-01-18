import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_booking_app/constants/number_custant.dart';
import 'package:ride_booking_app/constants/strings_constant.dart';
import 'package:ride_booking_app/provider/trip_provider.dart';
import 'package:ride_booking_app/screens/add_trip_screen.dart';

import '../constants/global_utils.dart';
import '../models/trip_model.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(tripsProvider);
    ref.listen<List<Trip>>(tripsProvider, (previous, next) {
      if (previous == null || previous.isEmpty) return;

      for (final trip in next) {
        final oldTrip = previous.firstWhere(
              (t) => t.id == trip.id,
          orElse: () => trip,
        );

        if (oldTrip.status != trip.status) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Trip ${trip.status.name.replaceAll("_", " ").toUpperCase()}',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.MY_TRIP,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: trips.length,
        padding: EdgeInsets.all(Numbers.LABEL_TEXT_SIZE_16),
        itemBuilder: (context, i) {
          final trip = trips[i];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Numbers.PADDING_HEIGHT_10),
            ),
            child: ListTile(
              title: Text('${trip.pickupLocation} → ${trip.dropLocation}'),
              subtitle: Row(
                children: [
                  Text('₹${trip.fare.toStringAsFixed(0)}'),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text(trip.status.name),
                    backgroundColor: statusColor(trip.status),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(tripsProvider.notifier).deleteTrip(trip.id);
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: Numbers.PADDING_HEIGHT_10,),
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
