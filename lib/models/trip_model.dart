import 'package:hive/hive.dart';
import 'ride_status.dart';
import 'ride_type.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class Trip extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String pickupLocation;

  @HiveField(2)
  final String dropLocation;

  @HiveField(3)
  final RideType rideType;

  @HiveField(4)
  final double fare;

  @HiveField(5)
  final DateTime dateTime;

  @HiveField(6)
  final RideStatus status;

  Trip({
    required this.id,
    required this.pickupLocation,
    required this.dropLocation,
    required this.rideType,
    required this.fare,
    required this.dateTime,
    required this.status,
  });

  Trip copyWith({
    RideStatus? status,
    double? fare,
  }) {
    return Trip(
      id: id,
      pickupLocation: pickupLocation,
      dropLocation: dropLocation,
      rideType: rideType,
      fare: fare ?? this.fare,
      dateTime: dateTime,
      status: status ?? this.status,
    );
  }
}
