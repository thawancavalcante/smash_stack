import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smash/blocs/blocs.dart';
import 'package:smash/ui/pages/home/widgets/widgets.dart';
import 'package:smash/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double animationValue = 0;

  void onScroll(ScrollController controller) {
    if (!controller.hasClients) return;

    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;

    setAnimationValue(currentScroll);

    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<CountryBloc>().add(const CountryFetchEvent());
    }
  }

  void setAnimationValue(double currentScroll) {
    int speed = 100;
    double height = MediaQuery.of(context).size.height;
    double itemsPassed = currentScroll / height * speed;

    double progress = itemsPassed / 100;
    if (progress > 1) {
      progress -= progress.floor();
    }

    setState(() {
      animationValue = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              Header(animationValue: animationValue),
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
                  child: BlocBuilder<CountryBloc, CountryState>(
                      builder: (context, state) {
                    bool noItemsFound = !state.loading &&
                        state.items.isEmpty &&
                        state.error == null;

                    bool hasError = !state.loading && state.error != null;

                    return Column(
                      children: [
                        if (noItemsFound) const ScrollListEmptyState(),
                        if (state.items.isNotEmpty)
                          Items(
                            onScroll: onScroll,
                            state: state,
                          ),
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
    );
  }
}
