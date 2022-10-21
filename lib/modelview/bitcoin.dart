import '../model/class/Cripto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Cripto> fetchBitcoin() async {
  final response = await http
      .get(Uri.parse('https://www.mercadobitcoin.net/api/BTC/ticker/'));

  if (response.statusCode == 200) {
    return Cripto.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
