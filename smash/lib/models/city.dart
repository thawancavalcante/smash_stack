import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  const CityModel({
    required this.id,
    required this.name,
    required this.subcountry,
  });

  final String id;
  final String name;
  final String subcountry;

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as String,
      name: json['name'] as String,
      subcountry: json['subcountry'] as String,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        subcountry,
      ];
}
