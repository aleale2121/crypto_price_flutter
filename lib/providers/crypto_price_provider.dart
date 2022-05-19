import 'package:flutter/material.dart';
import 'package:woo_flutter_test/models/models.dart';
import 'package:woo_flutter_test/services/services.dart';
import 'package:woo_flutter_test/shared/constants.dart';

class CryptoPriceProvider extends ChangeNotifier {
  final CryptoPriceService priceService;
  CryptoPriceProvider({required this.priceService});

  List<CryptoPrice> cryptoPrices = [];
  bool loading = false;
  String query = "";
  final basepriority = ["BTC", "ETH", "WOO"];
  final quotepriority = ["USDT", "USDC", "PERP"];
  final cryptoTypeFilters = ["FUTURES", "SPOT"];
  String sortBy = "";
  String ascend = "";

  void getCryptoPrices() {
    setLoading(true);
    cryptoPrices = priceService.getCryptoPrices();
    setLoading(false);
  }

  void setLoading(bool loadingState) {
    loading = loadingState;
    notifyListeners();
  }

  void setSorting(String sortField) {
    if (sortField != sortBy) {
      ascend = ascending;
      sortBy = sortField;
    } else {
      if (ascend == "") {
        ascend = ascending;
      } else if (ascend == ascending) {
        ascend = descending;
      } else {
        ascend = "";
        sortBy = "";
      }
    }

    notifyListeners();
  }

  List<CryptoPrice> filter(
    String cryptoType,
  ) {
    var filterdCryptoPrices = <CryptoPrice>[];
    if (cryptoTypeFilters.contains(cryptoType)) {
      filterdCryptoPrices =
          cryptoPrices.where((element) => element.type == cryptoType).toList();
    } else {
      filterdCryptoPrices = [...cryptoPrices];
    }
    if (sortBy != "") {
      sortByType(filterdCryptoPrices);
      if (ascend == descending) {
        filterdCryptoPrices = filterdCryptoPrices.reversed.toList();
      }
    } else {
      sortByDefault(filterdCryptoPrices, cryptoType);
    }

    if (query != "") {
      return search(filterdCryptoPrices);
    }
    return filterdCryptoPrices;
  }

  List<CryptoPrice> search(List<CryptoPrice> filterdCryptoPrices) {
    return filterdCryptoPrices
        .where(
          (r) => r.base
              .toLowerCase()
              .contains(query.toLowerCase().replaceAll(" ", "")),
        )
        .toList();
  }

  void sortByType(List<CryptoPrice> filterdCryptoPrices) {
    if (sortBy == volume) {
      filterdCryptoPrices.sort((a, b) => a.volume.compareTo(b.volume));
    } else if (sortBy == lastPrice) {
      filterdCryptoPrices.sort((a, b) => a.lastPrice.compareTo(b.lastPrice));
    } else if (sortBy == symbol) {
      filterdCryptoPrices.sort(
        (a, b) {
          int baseComp = a.base.compareTo(b.base);
          if (baseComp == 0) {
            int qouteComp = a.quote.compareTo(b.quote);
            if (qouteComp == 0) {
              return a.type.compareTo(b.type);
            }
            return qouteComp;
          }
          return baseComp;
        },
      );
    }
  }

  void sortByDefault(
    List<CryptoPrice> filterdCryptoPrices,
    String cryptoType,
  ) {
    if (cryptoTypeFilters.contains(cryptoType)) {
      filterdCryptoPrices.sort((a, b) => a.volume.compareTo(b.volume));
      filterdCryptoPrices = filterdCryptoPrices.reversed.toList();
    } else {
      filterdCryptoPrices.sort((a, b) {
        return a.base.compareTo(b.base);
      });
      filterdCryptoPrices.sort((a, b) {
        if (basepriority.contains(b.base)) {
          if (basepriority.contains(a.base)) {
            if (basepriority.indexOf(b.base) < basepriority.indexOf(a.base)) {
              return 1;
            }
            return -1;
          }
          return 1;
        }
        int result = a.base.compareTo(b.base);
        if (result == 0) {
          if (quotepriority.contains(b.quote)) {
            if (quotepriority.contains(a.quote)) {
              if (quotepriority.indexOf(b.quote) <
                  quotepriority.indexOf(a.quote)) {
                return 1;
              }
              return -1;
            }
            return 1;
          }
        }
        return result;
      });
    }
  }

  void changeSearchQuery(String newQuery) async {
    query = newQuery;
    notifyListeners();
  }
}
