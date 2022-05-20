import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    _tabController = TabController(
      vsync: this,
      length: 3,
      animationDuration: const Duration(milliseconds: 1200)
    );
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
            SearchBar(searchController: _controller),
            const SizedBox(height: 15),
            const TableHeader(),
            TableBody(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}
