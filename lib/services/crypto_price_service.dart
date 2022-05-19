import 'package:woo_flutter_test/models/models.dart';

class CryptoPriceService {
  List<CryptoPrice> getCryptoPrices() {
    final prices = <CryptoPrice>[];
    for (final data in _data) {
      prices.add(CryptoPrice.fromMap(data));
    }
    return prices;
  }

  final _data = [
    {
      "base": 'BTC',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 43899.92,
      "volume": 246944876.72997272,
    },
    {
      "base": 'ETH',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 3132.67,
      "volume": 177111682.0831828,
    },
    {
      "base": 'DODO',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 0.601,
      "volume": 2406.8213148,
    },
    {
      "base": 'USDC',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 0.9993,
      "volume": 146155.347837,
    },
    {
      "base": 'SHIB',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 0.00003288,
      "volume": 5848644.59795569,
    },
    {
      "base": 'DOGE',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 0.164544,
      "volume": 8114501.025757,
    },
    {
      "base": 'NEAR',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 13.501,
      "volume": 1448972.921938,
    },
    {
      "base": 'OKB',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 22.973,
      "volume": 5128.2330661,
    },
    {
      "base": 'WOO',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 0.80146,
      "volume": 6099463.5366493,
    },
    {
      "base": 'XRP',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 0.8633,
      "volume": 10964532.135953,
    },
    {
      "base": 'DYDX',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 8.179,
      "volume": 366540.0043351,
    },
    {
      "base": 'AURORA',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 14.213,
      "volume": 4436.1874587,
    },
    {
      "base": 'ATOM',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 31.832,
      "volume": 3038527.85901,
    },
    {
      "base": 'LINK',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 18.825,
      "volume": 3268539.039502,
    },
    {
      "base": 'SUSHI',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 4.8646,
      "volume": 774147.137607,
    },
    {
      "base": 'QRDO',
      "quote": 'USDT',
      "type": 'SPOT',
      "lastPrice": 3.67602,
      "volume": 107119.72425381,
    },
    {
      "base": 'BTC',
      "quote": 'USDC',
      "type": 'SPOT',
      "lastPrice": 43210.53,
      "volume": 4682391.712736,
    },
    {
      "base": 'ETH',
      "quote": 'USDC',
      "type": 'SPOT',
      "lastPrice": 3456.78,
      "volume": 72342.81923,
    },
    {
      "base": 'BSV',
      "quote": 'USDC',
      "type": 'SPOT',
      "lastPrice": 102.78,
      "volume": 129837.32864,
    },
    {
      "base": 'BTC',
      "quote": 'USDT',
      "type": 'FUTURES',
      "lastPrice": 44409,
      "volume": 67823641,
    },
    {
      "base": 'ETH',
      "quote": 'USDT',
      "type": 'FUTURES',
      "lastPrice": 3333.00,
      "volume": 67823642,
    },
  ];
}
