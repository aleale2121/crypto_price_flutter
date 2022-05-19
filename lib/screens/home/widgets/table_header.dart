import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woo_flutter_test/providers/providers.dart';
import 'package:woo_flutter_test/screens/home/widgets/header_item.dart';
import 'package:woo_flutter_test/shared/constants.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoPriceProvider>(builder: (context, crpProvider, _) {
      return Table(
        border: TableBorder(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
            style: BorderStyle.solid,
          ),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1.0),
          1: FlexColumnWidth(1.0),
          2: FlexColumnWidth(1.0),
        },
        children: [
          TableRow(
            decoration: crpProvider.ascend != ""
                ? BoxDecoration(color: Colors.grey[300])
                : BoxDecoration(color: Colors.grey[200]),
            children: [
              HeaderItem(
                label: " Symbol ",
                alignment: Alignment.centerLeft,
                ascend: crpProvider.ascend,
                isSortingField: crpProvider.sortBy == symbol,
                onTap: ()=>crpProvider.setSorting(symbol),
              ),
              HeaderItem(
                label: "Last Price ",
                alignment: Alignment.centerRight,
                ascend: crpProvider.ascend,
                isSortingField: crpProvider.sortBy == lastPrice,
                onTap: ()=>crpProvider.setSorting(lastPrice),
              ),
              HeaderItem(
                label: "Volume ",
                alignment: Alignment.centerRight,
                ascend: crpProvider.ascend,
                isSortingField: crpProvider.sortBy == volume,
                onTap: ()=>crpProvider.setSorting(volume),
              )
            ],
          )
        ],
      );
    });
  }
}
