import 'package:flutter/material.dart';
class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: Colors.black,
      expandedHeight: 80,
      bottom: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor:  Colors.orangeAccent,
        indicatorWeight: 2,
        tabs: const [
          Tab(
            child: Text('All'),
          ),
          Tab(
            child: Text('FUTURES'),
          ),
          Tab(child: Text('SPOT')),
        ],
      ),
    );
  }
}