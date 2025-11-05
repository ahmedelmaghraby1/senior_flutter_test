import 'package:riverpod/riverpod.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';
import 'package:senior_flutter_test/features/home/domain/use_cases/get_trips_use_case.dart';
import 'package:senior_flutter_test/features/home/providers/providers.dart';

class TripsNotifier extends AsyncNotifier<List<Trip>> {
  late final GetTripsUseCase _getTripsUseCase;

  @override
  Future<List<Trip>> build() async {
    _getTripsUseCase = ref.read(getTripsUseCaseProvider);
    final result = await _getTripsUseCase();
    return result.fold((failure) => throw failure, (trips) => trips);
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _getTripsUseCase();
      return result.fold((failure) => throw failure, (trips) => trips);
    });
  }
}
