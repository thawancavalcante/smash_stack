import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smash/models/models.dart';
import 'package:smash/repositories/firestore/firestore.dart' as firestore;

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc(CountryModel country) : super(CityState(country: country)) {
    on<CityFetchEvent>(_onFetch);
  }

  Future<void> _onFetch(
    CityFetchEvent event,
    Emitter<CityState> emit,
  ) async {
    if (!state.hasMoreItems || state.loading) return;

    emit(state.copyWith(loading: true));

    try {
      List<CityModel> items = await firestore.City.list(
        countryId: state.country.id,
        lastDocumentId: state.items.lastOrNull?.id,
      );

      if (items.isEmpty) {
        return emit(state.copyWith(
          loading: false,
          hasMoreItems: false,
        ));
      }

      return emit(state.copyWith(
        items: [...state.items, ...items],
        loading: false,
        error: null,
      ));
    } catch (e) {
      return emit(state.copyWith(
        error: e.toString(),
        loading: false,
      ));
    }
  }
}
