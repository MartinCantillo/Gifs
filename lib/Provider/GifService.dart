import 'dart:convert';

import 'package:gif/Models/Gifts.dart';
import 'package:http/http.dart' as http;

class GiftServic {
  final String endpoint =
      'https://api.giphy.com/v1/gifs/trending?api_key=081Z33Gf8OaNbdK1upYCzUqPGG90MimV&limit=10&rating=g';
  Future<List<Gifs>> fecthGifs() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      List<Gifs> GifsList = data.map((e) => Gifs.fromJson(e)).toList();
      GifsList.forEach((element) {
        print(element.toString());
      });

      return GifsList;
    } else {
      throw Exception('Error del servidor ${response.statusCode}');
    }
  }
}
