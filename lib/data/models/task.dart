import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';


@JsonSerializable()
class Task {
  final int id;
  final String description;
  final String createdDate;
  final String status;

  const Task({
    required this.id,
    required this.description,
    required this.createdDate,
    required this.status,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
