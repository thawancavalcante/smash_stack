import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smash/models/models.dart';
import 'package:smash/repositories/firestore/firestore.dart' as firestore;

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(const CountryState()) {
    on<CountryFetchEvent>(_onFetch);
  }

  Future<void> _onFetch(
    CountryFetchEvent event,
    Emitter<CountryState> emit,
  ) async {
    if (!state.hasMoreItems || state.loading) return;

    emit(state.copyWith(loading: true));

    try {
      List<CountryModel> items = await firestore.Country.list(
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
