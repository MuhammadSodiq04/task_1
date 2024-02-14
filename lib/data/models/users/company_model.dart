//"name": "Romaguera-Crona",
// "catchPhrase": "Multi-layered client-server neural-net",
// "bs": "harness real-time e-markets"

class CompanyModel{
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json["name"] as String? ?? "",
      catchPhrase: json["catchPhrase"] as String? ?? "",
      bs: json["bs"] as String? ?? "",
    );
  }
}