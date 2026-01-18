import 'package:hive/hive.dart';

part 'ride_status.g.dart';

@HiveType(typeId: 1)
enum RideStatus {
  @HiveField(0)
  requested,

  @HiveField(1)
  driverAssigned,

  @HiveField(2)
  rideStarted,

  @HiveField(3)
  completed,

  @HiveField(4)
  cancelled,
}
