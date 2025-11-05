import 'package:json_annotation/json_annotation.dart';
import 'package:senior_flutter_test/features/home/domain/entities/tourist.dart';

part 'tourist_model.g.dart';

@JsonSerializable(createToJson: true)
class TouristModel {
  final String? id;
  final String name;
  @JsonKey(name: 'avatar_url')
  final String? image;

  TouristModel({this.id, required this.name, this.image});

  factory TouristModel.fromJson(Map<String, dynamic> json) =>
      _$TouristModelFromJson(json);
}

extension MapToDomain on TouristModel {
  Tourist toDomain() => Tourist(id: id, name: name, image: image);
}
