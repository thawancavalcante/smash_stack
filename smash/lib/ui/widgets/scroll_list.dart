import 'package:flutter/material.dart';

class ScrollList extends StatefulWidget {
  const ScrollList({
    super.key,
    required this.onScroll,
    required this.itemBuilder,
    required this.itemCount,
  });

  final Function(ScrollController controller) onScroll;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  @override
  State<ScrollList> createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
  final _scrollController = ScrollController();

  void _onScroll() {
    widget.onScroll(_scrollController);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        itemBuilder: widget.itemBuilder,
        itemCount: widget.itemCount,
        controller: _scrollController,
      ),
    );
  }
}
