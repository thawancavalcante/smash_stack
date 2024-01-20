import 'package:flutter/material.dart';
import 'package:smash/blocs/blocs.dart';
import 'package:smash/ui/pages/city/list_page.dart';
import 'package:smash/ui/widgets/widgets.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.state,
    required this.onScroll,
  });

  final CountryState state;
  final Function(ScrollController controller) onScroll;

  @override
  Widget build(BuildContext context) {
    return ScrollList(
      itemBuilder: (BuildContext context, int index) {
        return index >= state.items.length
            ? state.loading
                ? const ScrollListLoading()
                : const SizedBox()
            : Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CityListPage.routeName,
                          arguments: CityListPageArguments(
                            country: state.items[index],
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            const Icon(Icons.language_rounded),
                            const SizedBox(width: 8),
                            Text(state.items[index].name),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.blueGrey[100],
                    ),
                  ],
                ),
              );
      },
      itemCount:
          state.hasMoreItems ? state.items.length + 1 : state.items.length,
      onScroll: onScroll,
    );
  }
}
