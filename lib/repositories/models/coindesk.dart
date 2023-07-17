class CoinDesk {
  final String code;
  final String rate;

  const CoinDesk({
    required this.code,
    required this.rate,
  });

  factory CoinDesk.fromJson(Map<String, dynamic> json) {
    return CoinDesk(
      code: json['code'] ?? 'Нет данных',
      rate: json['rate'] ?? '0',
    );
  }

  @override
  String toString() {
    return ('$code,$rate');
  }
}
