import 'package:equatable/equatable.dart';

class CountryModel extends Equatable {
  const CountryModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
