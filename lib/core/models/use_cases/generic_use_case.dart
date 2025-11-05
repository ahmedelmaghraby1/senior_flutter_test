import 'package:senior_flutter_test/core/models/errors/failure_model.dart';
import 'package:senior_flutter_test/core/models/either/either.dart';

abstract class UseCase<Types, Parameters> {
  Future<Either<Failure, Types>> call({Parameters? parameters});
}
