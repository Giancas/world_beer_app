import 'package:flutter/material.dart';
import 'package:world_beers_app/constants.dart';
//Model
import '../models/beer_model.dart';
//Routes
import '../screens/detail_product_screen.dart';

class BeerWidget extends StatelessWidget {
  const BeerWidget({Key? key, required this.beer}) : super(key: key);
  final BeerModel beer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(DetailProductScreen.routeName, arguments: {
        'name': beer.name,
        'imgUrl': beer.imgUrl,
        'first_brewed': beer.firstBrewed,
        'food_pairing': beer.foodPairing,
        'brewers_tips': beer.brewersTips,
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        shadowColor: Colors.blueGrey,
        margin: const EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Image.network(
                beer.imgUrl!,
                width: 150,
                height: 250,
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        beer.name!,
                        style: bebasStyle,
                      ),
                      Flexible(
                          child: SingleChildScrollView(
                        padding: const EdgeInsets.all(3),
                        child: Text(beer.description!),
                      )),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'ALCOHOL: ${beer.abv ?? 'N/A'}',
                              style: bebasStyle,
                            ),
                            Text(
                              'IBU: ${beer.ibu ?? 'N/A'}',
                              style: bebasStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
