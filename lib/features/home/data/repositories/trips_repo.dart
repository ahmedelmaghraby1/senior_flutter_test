import 'package:senior_flutter_test/core/models/either/either.dart';
import 'package:senior_flutter_test/core/models/errors/failure_model.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';

abstract class TripsRepo {
  Future<Either<Failure, List<Trip>>> getTrips();
}
