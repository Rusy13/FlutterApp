import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr1/repositories/coindesk/models/coindesk.dart';
import 'dart:convert';

class NetworkManager {
  Future<List<CoinDesk>> getList() async {
    final response = await Dio().get(
      'https://api.coindesk.com/v1/bpi/currentprice.json'
    );

    //print(json.decode(response.data)['bpi']);
    final data = json.decode(response.data);

    final dataList = data.entries;

    var list1 = data['bpi'] as Map<String,dynamic>;
    List<CoinDesk> list2 = [];
    for(final el in list1.values){
      list2.add(CoinDesk.fromJson(el)
    );
    }
    //var list2 = list1.map((e) => CoinDesk.fromJson(e)).toList();
    
    print('111');
    print(list2);
    print('222');

    return list2;
  }
}


// Получение значения "EUR:rate_float"
//  double eurRate = data['bpi']['EUR']['rate_float'];

// Получение значения "USD:rate_float"
//  double usdRate = data['bpi']['USD']['rate_float'];