part of 'country_bloc.dart';

sealed class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object?> get props => [];
}

final class CountryFetchEvent extends CountryEvent {
  const CountryFetchEvent();

  @override
  List<Object?> get props => [];
}
