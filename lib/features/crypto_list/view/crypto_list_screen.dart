import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter_test_application/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_test_application/repositories/crypto_coins.dart';
import 'package:get_it/get_it.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});


  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();

}

class _CryptoListScreenState extends State<CryptoListScreen> {

  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currencies List"),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.coinsList.length,
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(cryptoCoin: coin);
              },
            );
          }
          if(state is CryptoListLoadingFailure){
            return Center(
                child: Text(state.exception?.toString() ?? 'Unknown exception'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}