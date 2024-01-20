part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object?> get props => [];
}

final class CityFetchEvent extends CityEvent {
  const CityFetchEvent();

  @override
  List<Object?> get props => [];
}
