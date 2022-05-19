import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:woo_flutter_test/providers/providers.dart';
import 'package:woo_flutter_test/screens/home/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _controller = TextEditingController();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    SchedulerBinding.instance?.addPostFrameCallback((_) {});
    _tabController.addListener(() => _handleTabSelection(context));
  }

  _handleTabSelection(BuildContext context) {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [CustomeAppBar(tabController: _tabController)];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            SearchBar(
              searchController: _controller,
            ),
            const SizedBox(height: 15),
            const TableHeader(),
            TableBody(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}

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
        indicatorColor:  Colors.yellowAccent,
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

class TableBody extends StatelessWidget {
  const TableBody({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Consumer<CryptoPriceProvider>(builder: (context, provider, _) {
        return TabBarView(
          controller: _tabController,
          children: [
            CustomeDataTable(
              dataList: provider.filter("All"),
            ),
            CustomeDataTable(
              dataList: provider.filter("FUTURES"),
            ),
            CustomeDataTable(
              dataList: provider.filter("SPOT"),
            ),
          ],
        );
      }),
    );
  }
}
