import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'package:senior_flutter_test/features/home/data/models/trip_model/trip_model.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';

abstract class TripsLocalDataSource {
  Future<List<Trip>> getTrips();
}

class TripsLocalDataSourceImplementation implements TripsLocalDataSource {
  List<Trip> parsingTrips(List<dynamic> tripsList) {
    List<Trip> trips = tripsList
        .map((t) => TripModel.fromJson(t as Map<String, dynamic>).toDomain())
        .toList();
    log(trips.toString());
    return trips;
  }

  @override
  Future<List<Trip>> getTrips() async {
    // Simulate fetching data from local storage
    final jsonString = await rootBundle.loadString(
      'assets/local_data_assets/trips_mock.json',
    );
    final Map<String, dynamic> data = jsonDecode(jsonString);
    final List<dynamic> tripsList = data['trips'] as List<dynamic>? ?? [];
    log(tripsList.toString());
    return parsingTrips(tripsList);
  }
}

// Add more mock trips
