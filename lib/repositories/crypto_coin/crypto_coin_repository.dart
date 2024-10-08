import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../crypto_coins.dart';


class CryptoCoinsRepository implements AbstractCoinsRepository{
   CryptoCoinsRepository({
    required this.dio,
});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async{
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,TON,PEPE&tsyms=USD'
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String,dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
          final usdData =
            (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
          final price = usdData['PRICE'];
          final image = usdData['IMAGEURL'];
          return CryptoCoin(
            name: e.key,
            priceInUSD: price,
            imageURL: 'https://www.cryptocompare.com/$image',
          );
        }).toList();
    return cryptoCoinsList;

    debugPrint(response.toString());
  }
}