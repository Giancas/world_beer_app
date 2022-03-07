class BeerModel {
  int? id;
  String? name, description, imgUrl, firstBrewed, brewersTips;
  List? foodPairing;
  num? abv, ibu;
  BeerModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.description,
    this.abv,
    this.ibu,
    this.firstBrewed,
    this.foodPairing,
    this.brewersTips,
  });
}
