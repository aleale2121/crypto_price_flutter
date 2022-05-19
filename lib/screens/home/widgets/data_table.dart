import 'package:flutter/material.dart';

import 'package:woo_flutter_test/models/crypto_price.dart';
import 'package:intl/intl.dart';

class CustomeDataTable extends StatelessWidget {
  final List<CryptoPrice> dataList;
  const CustomeDataTable({
    Key? key,
    required this.dataList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder(
          horizontalInside: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
          ),
        ),
        children: _createRows(),
      ),
    );
  }

  List<TableRow> _createRows() {
    return dataList
        .map((data) => TableRow(children: [
              Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  child: Text(
                    getSymbol(data),
                  )),
              Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  child: Text(
                    getLastPrice(data),
                  )),
              Container(
                  alignment: Alignment.centerRight,
                  height: 50,
                  child: Text(
                    getVolume(data),
                  ))
            ]))
        .toList();
  }

  String getSymbol(CryptoPrice data) {
    return data.type == "SPOT"
        ? "${data.base}/${data.quote}"
        : "${data.base}-PERP";
  }

  String getLastPrice(CryptoPrice data) {
    var formatter = NumberFormat.currency(locale: "en_US", symbol: "\$");
    return formatter.format(data.lastPrice);
  }

  String getVolume(CryptoPrice data) {
    var formatter = NumberFormat.compact();
    return formatter.format(data.volume);
  }
}
