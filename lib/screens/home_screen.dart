import 'package:flutter/material.dart';
import 'package:world_beers_app/constants.dart';
import 'package:world_beers_app/models/beer_model.dart';
//Widgets
import '../widgets/beer_widget.dart';
import '../widgets/search_widget.dart';
//Providers
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BeerModel> listOfBeers = [];
  List<BeerModel> filterListOfBeers = [];
  String query = '';
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false)
        .getProducts()
        .whenComplete(() => listOfBeers =
            Provider.of<ProductsProvider>(context, listen: false)
                .listOfProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'World Beers',
          style: bebasStyle,
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        shadowColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Our beers:',
              style: bebasStyle,
            ),
          ),
          SearchWidget(
            text: query,
            onChanged: (search) {
              filterListOfBeers = listOfBeers.where((beer) {
                final name = beer.name?.toLowerCase();
                final description = beer.description?.toLowerCase();
                final searchLower = search.toLowerCase();
                return name?.contains(searchLower) as bool ||
                    description?.contains(searchLower) as bool;
              }).toList();
              setState(() {
                query = search;
              });
            },
          ),
          Consumer<ProductsProvider>(
            builder: (_, products, __) {
              return Expanded(
                child: ListView.builder(
                    itemCount: query.isEmpty
                        ? listOfBeers.length
                        : filterListOfBeers.length,
                    itemBuilder: (ctx, index) => BeerWidget(
                          beer: query.isEmpty
                              ? listOfBeers[index]
                              : filterListOfBeers[index],
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
