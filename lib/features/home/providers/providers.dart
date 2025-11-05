import 'package:riverpod/riverpod.dart';
import 'package:senior_flutter_test/features/home/data/data_sources/trips_local_data_source.dart';
import 'package:senior_flutter_test/features/home/data/repositories/trips_repo.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';
import 'package:senior_flutter_test/features/home/domain/repositories/trips_repo_implementation.dart';
import 'package:senior_flutter_test/features/home/domain/use_cases/get_trips_use_case.dart';
import 'package:senior_flutter_test/features/home/presentation/view_models/trips_notifier.dart';

final tripsDataSourceProvider = Provider<TripsLocalDataSource>((ref) {
  return TripsLocalDataSourceImplementation();
});
final tripsRepoProvider = Provider<TripsRepo>((ref) {
  return TripsRepoImplementation(
    tripsLocalDataSource: ref.read(tripsDataSourceProvider),
  );
});

final getTripsUseCaseProvider = Provider<GetTripsUseCase>((ref) {
  return GetTripsUseCase(tripsRepo: ref.read(tripsRepoProvider));
});
final tripsNotifierProvider = AsyncNotifierProvider<TripsNotifier, List<Trip>>(
  () => TripsNotifier(),
);
