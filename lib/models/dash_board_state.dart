class DashboardState {
  final int totalTrips;
  final int completedTrips;
  final int cancelledTrips;
  final Map<String, int> driverTrips;
  final List<int> liveTripCount;

  DashboardState({
    required this.totalTrips,
    required this.completedTrips,
    required this.cancelledTrips,
    required this.driverTrips,
    required this.liveTripCount,
  });

  factory DashboardState.initial() => DashboardState(
    totalTrips: 0,
    completedTrips: 0,
    cancelledTrips: 0,
    driverTrips: {},
    liveTripCount: [],
  );
}
