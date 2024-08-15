import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_application/repositories/crypto_coin/abstract_coins_repository.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_list_app.dart';
import 'repositories/crypto_coin/crypto_coin_repository.dart';

void main() {
  GetIt.instance.registerLazySingleton<AbstractCoinsRepository>(() => CryptoCoinsRepository(dio: Dio()));
  runApp(const CurrenciesList());
}






