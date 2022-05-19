import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:woo_flutter_test/providers/crypto_price_provider.dart';
import 'package:woo_flutter_test/screens/home/home_screen.dart';
import 'package:woo_flutter_test/services/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.bottom,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<CryptoPriceProvider>(
          create: (context) =>
              CryptoPriceProvider(priceService: CryptoPriceService())
                ..getCryptoPrices(),
        ),
      ], child: const Scaffold(body: HomeScreen())),
    );
  }
}
