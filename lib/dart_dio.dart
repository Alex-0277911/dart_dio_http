import 'dart:convert';

import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();

  final response =
      await dio.get('https://api.instantwebtools.net/v1/airlines/1');
  //
  Map<String, dynamic> json = jsonDecode(response.toString());
  Airline airline = Airline.fromJson(json);

  print('The slogan of ${airline.name} is: ');
  print('"${airline.slogan}"');
}

class Airline {
  int id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;

  Airline({
    required this.id,
    this.name,
    this.country,
    this.logo,
    this.slogan,
    this.headQuaters,
    this.website,
  });

  factory Airline.fromJson(Map<String, dynamic> json) {
    return Airline(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      logo: json['logo'],
      slogan: json['slogan'],
      headQuaters: json['head_quaters'],
      website: json['website'],
    );
  }
}

// https://api.instantwebtools.net/v1/airlines/1

// {
//         "id": 1,
//         "name": "Quatar Airways",
//         "country": "Quatar",
//         "logo": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/300px-Qatar_Airways_Logo.svg.png",
//         "slogan": "Going Places Together",
//         "head_quaters": "Qatar Airways Towers, Doha, Qatar",
//         "website": "www.qatarairways.com",
//         "established": "1994"
// }
