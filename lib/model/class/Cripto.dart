import 'package:flutter/material.dart';

class Cripto {
  final dynamic ticker;

  Cripto({@required this.ticker});

  factory Cripto.fromJson(Map<String, dynamic> json) {
    return Cripto(ticker: json['ticker']);
  }
}
