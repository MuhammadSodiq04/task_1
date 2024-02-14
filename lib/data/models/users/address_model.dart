// "street": "Kulas Light",
// "suite": "Apt. 556",
// "city": "Gwenborough",
// "zipcode": "92998-3874",
// "geo": {
// "lat": "-37.3159",
// "lng": "81.1496"
// }
class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json["street"] as String? ?? "",
      suite: json["suite"] as String? ?? "",
      city: json["city"] as String? ?? "",
      zipcode: json["zipcode"] as String? ?? "",
      lat: json["geo"]["lat"] as String? ?? "",
      lng: json["geo"]["lng"] as String? ?? "",
    );
  }
}
