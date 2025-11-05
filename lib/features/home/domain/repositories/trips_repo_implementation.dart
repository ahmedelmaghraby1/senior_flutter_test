import 'dart:developer';

import 'package:senior_flutter_test/core/models/either/either.dart';
import 'package:senior_flutter_test/core/models/errors/failure_model.dart';
import 'package:senior_flutter_test/core/models/errors/failures_model.dart';
import 'package:senior_flutter_test/features/home/data/data_sources/trips_local_data_source.dart';
import 'package:senior_flutter_test/features/home/data/repositories/trips_repo.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';

class TripsRepoImplementation extends TripsRepo {
  final TripsLocalDataSource tripsLocalDataSource;
  TripsRepoImplementation({required this.tripsLocalDataSource});
  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      List<Trip> trips = await tripsLocalDataSource.getTrips();
      return Either.succeed(trips);
    } catch (e) {
      log(e.toString());
      return Either.failed(LocalFailure(errorMessage: e.toString()));
    }
  }
}
