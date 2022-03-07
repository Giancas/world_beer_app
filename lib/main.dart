import 'package:flutter/material.dart';
//Screens
import 'screens/home_screen.dart';
import 'screens/detail_product_screen.dart';
//Providers
import 'providers/products_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'World Beers App',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (_) => const HomeScreen(),
          DetailProductScreen.routeName: (ctx) => const DetailProductScreen(),
        },
      ),
    );
  }
}
