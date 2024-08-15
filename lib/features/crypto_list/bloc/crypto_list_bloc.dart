import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_application/repositories/crypto_coin/abstract_coins_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/crypto_coins.dart';

part'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState>{
  CryptoListBloc(this.coinsRepository):super(CryptoListInitial()){
    on<LoadCryptoList>((event, emit)async{
      try{
        final cryptoCoinsList = await coinsRepository.getCoinsList();
        emit(CryptoListLoaded(cryptoCoinsList));
      } catch(e){
        emit(CryptoListLoadingFailure(e));
      }

    });
  }

  final AbstractCoinsRepository coinsRepository;
}