import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    print(this.url);
    Uri uri = Uri.parse(this.url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      try {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } catch (e) {
        print(e);
        return;
      }
    } else {
      return;
    }
  }
}
