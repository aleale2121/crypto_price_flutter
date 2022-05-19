import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woo_flutter_test/providers/providers.dart';
import 'package:woo_flutter_test/screens/home/widgets/data_table.dart';

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
