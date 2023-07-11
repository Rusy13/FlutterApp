class CoinDesk {
   const CoinDesk({
    required this.code,
    required this.rate,
  });
  factory CoinDesk.fromJson(Map<String,dynamic> json){
    return CoinDesk(
    code: json['code'] ?? 'Нет данных',
    rate: json['rate'] ?? '0',
    );
  }
  
  final String code;
  final String rate;


  @override
  String toString(){
    return('$code,$rate');
  }
}

