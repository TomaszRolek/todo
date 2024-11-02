// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      createdDate: json['createdDate'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdDate': instance.createdDate,
      'status': instance.status,
    };
