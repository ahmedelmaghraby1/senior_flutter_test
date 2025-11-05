import 'package:senior_flutter_test/features/home/domain/entities/tourist.dart';

class Trip {
  final String id;
  final String title;
  final String startDate;
  final String endDate;
  final String status;
  final int unfinishedTasks;
  final int nights;
  final String? image;

  final List<Tourist>? tourists;

  Trip({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.unfinishedTasks,
    required this.nights,
    this.image,
    this.tourists,
  });
}
