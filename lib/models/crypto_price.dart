import 'dart:convert';

class CryptoPrice {
  final String base;
  final String quote;
  final String type;
  final double lastPrice;
  final double volume;
  CryptoPrice({
    required this.base,
    required this.quote,
    required this.type,
    required this.lastPrice,
    required this.volume,
  });

  CryptoPrice copyWith({
    String? base,
    String? quote,
    String? type,
    double? lastPrice,
    double? volume,
  }) {
    return CryptoPrice(
      base: base ?? this.base,
      quote: quote ?? this.quote,
      type: type ?? this.type,
      lastPrice: lastPrice ?? this.lastPrice,
      volume: volume ?? this.volume,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base': base,
      'quote': quote,
      'type': type,
      'lastPrice': lastPrice,
      'volume': volume,
    };
  }

  factory CryptoPrice.fromMap(Map<String, dynamic> map) {
    return CryptoPrice(
      base: map['base'] ?? '',
      quote: map['quote'] ?? '',
      type: map['type'] ?? '',
      lastPrice: map['lastPrice']?.toDouble() ?? 0.0,
      volume: map['volume']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoPrice.fromJson(String source) =>
      CryptoPrice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(base: $base, quote: $quote, type: $type, lastPrice: $lastPrice, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoPrice &&
        other.base == base &&
        other.quote == quote &&
        other.type == type &&
        other.lastPrice == lastPrice &&
        other.volume == volume;
  }

  @override
  int get hashCode {
    return base.hashCode ^
        quote.hashCode ^
        type.hashCode ^
        lastPrice.hashCode ^
        volume.hashCode;
  }
}
