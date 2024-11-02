import 'package:json_annotation/json_annotation.dart';
part 'user_details.g.dart';


@JsonSerializable()
class UserDetails {
  final int id;
  final String name;
  final String email;
  final String createdDate;
  final String address;
  final String phone;

  const UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.createdDate,
    required this.address,
    required this.phone,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
