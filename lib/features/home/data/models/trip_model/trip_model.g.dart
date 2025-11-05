// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripModel _$TripModelFromJson(Map json) => TripModel(
  id: json['id'] as String,
  title: json['title'] as String,
  status: json['status'] as String,
  dates: DatesModel.fromJson(Map<String, dynamic>.from(json['dates'] as Map)),
  unfinishedTasks: (json['unfinished_tasks'] as num).toInt(),
  image: json['cover_image'] as String?,
  tourists: (json['participants'] as List<dynamic>?)
      ?.map((e) => TouristModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList(),
);
