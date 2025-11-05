import 'package:json_annotation/json_annotation.dart';
import 'package:senior_flutter_test/features/home/data/models/dates/dates_model.dart';
import 'package:senior_flutter_test/features/home/data/models/tourist_model/tourist_model.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class TripModel {
  final String id;
  final String title;
  final String status;
  final DatesModel dates;
  @JsonKey(name: 'unfinished_tasks')
  final int unfinishedTasks;
  @JsonKey(name: 'cover_image')
  final String? image;
  @JsonKey(name: 'participants')
  final List<TouristModel>? tourists;

  TripModel({
    required this.id,
    required this.title,
    required this.status,
    required this.dates,
    required this.unfinishedTasks,
    this.image,
    this.tourists,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);
}

extension MapToDomain on TripModel {
  Trip toDomain() => Trip(
    id: id,
    title: title,
    status: status,
    startDate: dates.startDate,
    endDate: dates.endDate,
    unfinishedTasks: unfinishedTasks,
    nights: 5,
    image: image,
    tourists: tourists?.map((e) => e.toDomain()).toList(),
  );
}
