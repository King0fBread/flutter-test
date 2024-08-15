import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class CurrenciesList extends StatelessWidget {
  const CurrenciesList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Currencies List',
      theme: darkTheme,
      routes: routes,
    );
  }
}