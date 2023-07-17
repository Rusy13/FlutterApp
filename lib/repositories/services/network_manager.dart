import 'package:dio/dio.dart';
import 'package:flutter_pr1/repositories/models/coindesk.dart';
import 'dart:convert';

class NetworkManager {
  Future<List<CoinDesk>> getList() async {
    final response =
        await Dio().get('https://api.coindesk.com/v1/bpi/currentprice.json');

    final data = json.decode(response.data);

    var list1 = data['bpi'] as Map<String, dynamic>;
    List<CoinDesk> list2 = [];
    for (final el in list1.values) {
      list2.add(CoinDesk.fromJson(el));
    }

    return list2;
  }
}
