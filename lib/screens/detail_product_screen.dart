import 'dart:io';

import 'package:flutter/material.dart';
import 'package:world_beers_app/constants.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({Key? key}) : super(key: key);
  static const routeName = '/detail_product';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
          color: Colors.black,
          iconSize: 30,
        ),
        title: Text(
          args['name'],
          style: bebasStyle,
        ),
        backgroundColor: primaryColor,
        shadowColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.blueGrey,
              margin: const EdgeInsets.all(15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(args['imgUrl']),
              ),
            ),
            InfoProduct(
              title: 'First Brewed:',
              description: args['first_brewed'],
            ),
            InfoProduct(
              title: 'Brewers Tips:',
              description: args['brewers_tips'],
            ),
            InfoProduct(
              title: 'Food Pairing:',
              foods: args['food_pairing'],
            )
          ],
        ),
      ),
    );
  }
}

class InfoProduct extends StatelessWidget {
  const InfoProduct({Key? key, this.title, this.description, this.foods})
      : super(key: key);
  final String? title;
  final String? description;
  final List? foods;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title!, style: bebasStyle),
            if (description != null) Text(description!),
            if (foods != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                    foods!.length, (index) => Text('- ${foods![index]}')),
              )
          ],
        ),
      ),
    );
  }
}
