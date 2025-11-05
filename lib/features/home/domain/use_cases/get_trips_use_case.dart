import 'package:senior_flutter_test/core/models/either/either.dart';
import 'package:senior_flutter_test/core/models/errors/failure_model.dart';
import 'package:senior_flutter_test/core/models/no_parameters/no_parameters_model.dart';
import 'package:senior_flutter_test/core/models/use_cases/generic_use_case.dart';
import 'package:senior_flutter_test/features/home/data/repositories/trips_repo.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';

class GetTripsUseCase extends UseCase<List<Trip>, NoParameters> {
  final TripsRepo tripsRepo;
  GetTripsUseCase({required this.tripsRepo});
  @override
  Future<Either<Failure, List<Trip>>> call({NoParameters? parameters}) {
    final Future<Either<Failure, List<Trip>>> result = tripsRepo.getTrips();
    return result;
  }
}
