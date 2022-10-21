import 'package:flutter/material.dart';

import '../model/class/Cripto.dart';
import '../modelview/bitcoin.dart';
import '../modelview/chainlink.dart';
import '../modelview/dogecoin.dart';
import '../modelview/etherium.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Cripto> bitcoin;
  late Future<Cripto> etherium;
  late Future<Cripto> dogecoin;
  late Future<Cripto> chainlink;

  @override
  void initState() {
    super.initState();
    bitcoin = fetchBitcoin();
    etherium = fetchEtherium();
    dogecoin = fetchDogecoin();
    chainlink = fetchChainlink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text('Obtenha a Cotação atualizada das principais Criptomoedas',
            textAlign: TextAlign.center),
        const CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/843700/pexels-photo-843700.jpeg'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'BitCoin',
                              textAlign: TextAlign.center,
                            ),
                            content: FutureBuilder(
                              future: bitcoin,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      'Valor: ${snapshot.data!.ticker['last']}');
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }

                                return const Text('Err');
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Fechar'),
                                child: const Text('Fechar'),
                              ),
                            ],
                          ),
                        ),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/991/991959.png',
                      width: 80,
                    )),
                TextButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Etherium',
                              textAlign: TextAlign.center,
                            ),
                            content: FutureBuilder(
                              future: etherium,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      'Valor: ${snapshot.data!.ticker['last']}');
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }

                                return const Text('Err');
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Fechar'),
                                child: const Text('Fechar'),
                              ),
                            ],
                          ),
                        ),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2089/2089382.png',
                      width: 80,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'DogeCoin',
                              textAlign: TextAlign.center,
                            ),
                            content: FutureBuilder(
                              future: dogecoin,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      'Valor: ${snapshot.data!.ticker['last']}');
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }

                                return const Text('Err');
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Fechar'),
                                child: const Text('Fechar'),
                              ),
                            ],
                          ),
                        ),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/825/825445.png',
                      width: 80,
                    )),
                TextButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Chainlink',
                              textAlign: TextAlign.center,
                            ),
                            content: FutureBuilder(
                              future: chainlink,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                      'Valor: ${snapshot.data!.ticker['last']}');
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }

                                return const Text('Err');
                              },
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Fechar'),
                                child: const Text('Fechar'),
                              ),
                            ],
                          ),
                        ),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2794/2794201.png',
                      width: 80,
                    )),
              ],
            )
          ],
        )
      ]),
    );
  }
}
