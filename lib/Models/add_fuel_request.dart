class addFuelRequest {
  final DateTime dateOfRequest;
  final double longitude;
  final double latitude;
  final double cost;

  const addFuelRequest({
    required this.dateOfRequest,
    required this.longitude,
    required this.latitude,
    required this.cost
  });
}
