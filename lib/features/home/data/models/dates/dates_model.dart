import 'package:json_annotation/json_annotation.dart';

part 'dates_model.g.dart';

@JsonSerializable()
class DatesModel {
  @JsonKey(name: 'start')
  final String startDate;
  @JsonKey(name: 'end')
  final String endDate;

  DatesModel({required this.startDate, required this.endDate});

  factory DatesModel.fromJson(Map<String, dynamic> json) =>
      _$DatesModelFromJson(json);
}
