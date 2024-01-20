import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smash/blocs/city_bloc/city_bloc.dart';
import 'package:smash/ui/widgets/widgets.dart';

class Items extends StatefulWidget {
  const Items({
    super.key,
    required this.state,
  });

  final CityState state;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  void onScroll(ScrollController controller) {
    if (!controller.hasClients) return;

    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.offset;

    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<CityBloc>().add(const CityFetchEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScrollList(
      itemBuilder: (BuildContext context, int index) {
        return index >= widget.state.items.length
            ? widget.state.loading
                ? const ScrollListLoading()
                : const SizedBox()
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.only(bottom: 5),
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const SizedBox(width: 8),
                        Text(widget.state.items[index].name),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blueGrey[100],
                  ),
                ],
              );
      },
      itemCount: widget.state.hasMoreItems
          ? widget.state.items.length + 1
          : widget.state.items.length,
      onScroll: onScroll,
    );
  }
}
