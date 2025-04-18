class CountryResponse {
  final List<Country> countries;

  CountryResponse({required this.countries});

  factory CountryResponse.fromJson(List<dynamic> jsonList) {
    return CountryResponse(
      countries: jsonList.map((json) => Country.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return countries.map((country) => country.toJson()).toList();
  }
}

class Country {
  final String id;
  final String flag;
  final String name;

  Country({
    required this.id,
    required this.flag,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'] as String,
      flag: json['flag'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'flag': flag,
      'name': name,
    };
  }
}
