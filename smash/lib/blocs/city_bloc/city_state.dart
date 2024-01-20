part of 'city_bloc.dart';

final class CityState extends Equatable {
  const CityState({
    required this.country,
    this.items = const [],
    this.hasMoreItems = true,
    this.loading = false,
    this.error,
  });

  final CountryModel country;
  final List<CityModel> items;
  final bool hasMoreItems;
  final bool loading;
  final String? error;

  CityState copyWith({
    List<CityModel>? items,
    bool? hasMoreItems,
    bool? loading,
    String? error,
  }) {
    return CityState(
      items: items ?? this.items,
      country: country,
      loading: loading ?? this.loading,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        items,
        country,
        hasMoreItems,
        loading,
        error,
      ];
}
