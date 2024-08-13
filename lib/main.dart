import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CurrenciesList());
}

class CurrenciesList extends StatelessWidget {
  const CurrenciesList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies List',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        dividerColor: Colors.grey,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orangeAccent,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25
            )),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          labelSmall: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 15
          )
        )
      ),
      routes: {
        '/': (context)=>CryptoListScreen(),
        '/coin': (context)=>CryptoCoinScreen()
      },
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});


  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currencies List"),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          itemBuilder: (context, i) {
            const coinName = "Bitcoin";
            return ListTile(
              leading: SvgPicture.asset('assets/svg/bitcoin_logo.svg', height: 50, width: 50),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                  coinName, style: theme.textTheme.bodyMedium),
              subtitle: Text(
                "60000\$", style: theme.textTheme.labelSmall,),
              onTap: (){
              Navigator.of(context).pushNamed('/coin', arguments: coinName);
            },
          );},
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'Must provide String args');
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}

