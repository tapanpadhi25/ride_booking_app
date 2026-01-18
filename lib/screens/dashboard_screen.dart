import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_booking_app/constants/number_custant.dart';
import 'package:ride_booking_app/screens/trips_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constants/strings_constant.dart';
import '../models/driver_bar_data.dart';
import '../models/pie_model.dart';
import '../models/ride_status.dart';
import '../provider/dashboard_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveValues = ref.watch(liveTripsCountProvider);
    final driverTrips = ref.watch(driverTripsProvider);
    final statusMap = ref.watch(rideStatusPieProvider);

    return SafeArea(
      top: false,bottom: true,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(Strings.DASHBOARD),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TripsScreen()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 280, child: buildLiveGraph(liveValues)),
              const SizedBox(height: 24),
              SizedBox(height: 280, child: buildDriverBarChart( driverTrips)),
              const SizedBox(height: 24),
              SizedBox(height: 280, child: buildStatusPieChart(statusMap)),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildLiveGraph(List<int> values) {
    return SfCartesianChart(
      title: ChartTitle(text: 'Live Trips'),
      primaryXAxis: NumericAxis(),
      series: <CartesianSeries<int, int>>[
        LineSeries<int, int>(
          dataSource: values,
          xValueMapper: (int value, int index) => index,
          yValueMapper: (int value, _) => value,
          markerSettings: const MarkerSettings(isVisible: true),
        ),
      ],
    );
  }

  Widget buildStatusPieChart(Map<RideStatus, int> data) {
    final List<PieData> data = [
      PieData('Assigned', 6),
      PieData('Started', 4),
      PieData('Completed', 10),
    ];

    return SfCircularChart(
      title: ChartTitle(text: 'Ride Status Distribution'),
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        PieSeries<PieData, String>(
          dataSource: data,
          xValueMapper: (d, _) => d.label,
          yValueMapper: (d, _) => d.value,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }


  Widget buildDriverBarChart(Map<String, int>  data) {
    final List<DriverBarData> data = [
      DriverBarData('Driver A', 12),
      DriverBarData('Driver B', 8),
      DriverBarData('Driver C', 15),
      DriverBarData('Driver D', 5),
    ];

    return SfCartesianChart(
      title: ChartTitle(text: 'Driver-wise Trips'),
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(),
      series: <CartesianSeries<DriverBarData, String>>[
        ColumnSeries<DriverBarData, String>(
          dataSource: data,
          xValueMapper: (d, _) => d.driver,
          yValueMapper: (d, _) => d.trips,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

}
