import 'package:flutter/material.dart';
import '../models/beer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsProvider with ChangeNotifier {
  List<BeerModel> products = [];
  List<BeerModel> listOfProducts() => [...products];

  Future<void> getProducts() async {
    if (products.isEmpty) {
      try {
        final Uri url = Uri.parse('https://api.punkapi.com/v2/beers');
        var data = await http.get(url);
        List<dynamic> jsonData = jsonDecode(data.body) as List;
        for (var beer in jsonData) {
          products.add(BeerModel(
            id: beer['id'],
            name: beer['name'],
            imgUrl: beer['image_url'],
            description: beer['description'],
            abv: beer['abv'],
            ibu: beer['ibu'],
            firstBrewed: beer['first_brewed'],
            foodPairing: beer['food_pairing'],
            brewersTips: beer['brewers_tips'],
          ));
        }
        notifyListeners();
      } catch (error) {
        rethrow;
      }
    }
  }
}
