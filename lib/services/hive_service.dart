import 'package:hive/hive.dart';
import '../models/trip_model.dart';

class HiveService {
  static const String tripBoxName = 'trips';

  static Box<Trip> get trips {
    if (!Hive.isBoxOpen(tripBoxName)) {
      throw Exception('Trips box is not opened');
    }
    return Hive.box<Trip>(tripBoxName);
  }
}
