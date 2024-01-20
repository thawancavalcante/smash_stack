part of 'country_bloc.dart';

final class CountryState extends Equatable {
  const CountryState({
    this.items = const [],
    this.hasMoreItems = true,
    this.loading = false,
    this.error,
  });

  final List<CountryModel> items;
  final bool hasMoreItems;
  final bool loading;
  final String? error;

  CountryState copyWith({
    List<CountryModel>? items,
    bool? hasMoreItems,
    bool? loading,
    String? error,
  }) {
    return CountryState(
      items: items ?? this.items,
      loading: loading ?? this.loading,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        items,
        hasMoreItems,
        loading,
        error,
      ];
}
