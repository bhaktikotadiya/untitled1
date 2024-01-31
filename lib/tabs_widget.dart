
import 'package:flutter/material.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({Key? key, this.tabs = const [], this.changeReceiver}) : super(key: key);
  final List<Tab> tabs;

  // To change the tab from outside, pass in the tab index through a stream
  final Stream<int>? changeReceiver;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> with SingleTickerProviderStateMixin {
  int _index = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this, initialIndex: _index);

    // Listen to tab index changes from external sources via this stream
    widget.changeReceiver?.listen((int newIndex) {
      setState(() {
        _index = newIndex;
        _tabController.animateTo(newIndex);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabs.isEmpty) return const SizedBox.shrink(); // If no tabs, show nothing
    return TabBar(tabs: widget.tabs, controller: _tabController, );
  }
}