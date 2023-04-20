// import 'dart:convert';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/directions.dart';
// import 'package:google_maps_webservice/geocoding.dart';
// import 'package:http/http.dart' as http;
//
// class DirectionsRepository {
//   DirectionsRepository._();
//   static final instance = DirectionsRepository._();
//
//   final _directionsService = GoogleMapsDirections(apiKey: 'YOUR_API_KEY_HERE');
//   final _geocodingService = GoogleMapsGeocoding(apiKey: 'YOUR_API_KEY_HERE');
//
//   Future<DirectionsResponse> getDirections({
//     required LatLng origin,
//     required LatLng destination,
//     TravelMode travelMode = TravelMode.driving,
//   }) async {
//     final originAddress = await _getAddressFromLatLng(origin);
//     final destinationAddress = await _getAddressFromLatLng(destination);
//
//     final directionsResult = await _directionsService.directionsWithAddress(
//       origin: '$originAddress',
//       destination: '$destinationAddress',
//       travelMode: travelMode,
//     );
//
//     if (directionsResult.isOkay) {
//       return directionsResult;
//     } else {
//       throw directionsResult.errorMessage!;
//     }
//   }
//
//   Future<String> _getAddressFromLatLng(LatLng latLng) async {
//     final address = await _geocodingService.searchByLocation(Location(latLng.latitude, latLng.longitude));
//     if (address.isOkay && address.results!.isNotEmpty) {
//       return address.results!.first.formattedAddress!;
//     } else {
//       throw 'Could not find address for location: $latLng';
//     }
//   }
// }
