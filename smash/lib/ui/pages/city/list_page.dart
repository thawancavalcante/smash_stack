import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smash/blocs/city_bloc/city_bloc.dart';
import 'package:smash/models/models.dart';
import 'package:smash/ui/pages/city/widgets/widgets.dart';
import 'package:smash/ui/widgets/widgets.dart';

final class CityListPageArguments {
  CityListPageArguments({required this.country});

  final CountryModel country;
}

class CityListPage extends StatefulWidget {
  static const String routeName = '/city/list';

  const CityListPage({super.key, required this.args});

  final CityListPageArguments args;

  @override
  State<CityListPage> createState() => _CityListPageState();
}

class _CityListPageState extends State<CityListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CityBloc(widget.args.country)..add(const CityFetchEvent()),
      lazy: false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                Header(
                  countryName: widget.args.country.name,
                  animationValue: 0,
                ),
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(1, 3),
                        ),
                      ],
                    ),
                    child: BlocBuilder<CityBloc, CityState>(
                        builder: (context, state) {
                      bool noItemsFound = !state.loading &&
                          state.items.isEmpty &&
                          state.error == null;

                      bool hasError = !state.loading && state.error != null;

                      return Column(
                        children: [
                          if (noItemsFound) const ScrollListEmptyState(),
                          if (state.items.isNotEmpty) Items(state: state),
                          if (hasError)
                            ScrollListErrorMessage(error: state.error!),
                          if (state.items.isEmpty && state.loading)
                            const ScrollListLoading(),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
