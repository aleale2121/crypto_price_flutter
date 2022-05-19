import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woo_flutter_test/providers/crypto_price_provider.dart';
import 'package:woo_flutter_test/screens/home/widgets/query_field.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  const SearchBar({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Selector<CryptoPriceProvider, String>(
      selector: (context, searchProvider) => searchProvider.query,
      builder: (context, query, _) {
        return SizedBox(
          height: 40,
          child: QueryField(
            queryTextEditingController: widget.searchController,
            search: Provider.of<CryptoPriceProvider>(context).changeSearchQuery,
          ),
        );
      },
    );
  }
}
