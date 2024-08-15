import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_application/repositories/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.cryptoCoin,
  });

  final CryptoCoin cryptoCoin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(cryptoCoin.imageURL, width: 50, height: 50),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
          cryptoCoin.name, style: theme.textTheme.bodyMedium),
      subtitle: Text(
        "${cryptoCoin.priceInUSD}\$", style: theme.textTheme.labelSmall,),
      onTap: (){
        Navigator.of(context).pushNamed('/coin', arguments: cryptoCoin);
      },
    );
  }
}