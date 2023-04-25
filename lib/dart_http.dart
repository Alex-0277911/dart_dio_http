import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.https('api.instantwebtools.net', '/v1/airlines/1');

  // Дочекайтеся відповіді http get, а потім декодуйте відповідь у форматі json.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    // final int id = jsonResponse['id'];
    final String name = jsonResponse['name'];
    final String slogan = jsonResponse['slogan'];

    print('The slogan of $name is: ');
    print('"$slogan"');
  } else {
    print('Request failed with status: ${response.statusCode}.');
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
