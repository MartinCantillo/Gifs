import 'dart:convert';

import 'package:gif/Models/Gifts.dart';
import 'package:http/http.dart' as http;

class GiftServic {
  static String endpoint =
      'https://api.giphy.com/v1/gifs/trending?api_key=081Z33Gf8OaNbdK1upYCzUqPGG90MimV&limit=10&rating=g';

  static Future<List<Datum>> fecthGifs() async {
    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        //  print(data);
        List<Datum> gifsList = data.map((e) => Datum.fromJson(e as Map<String, dynamic>)).toList();
       
        return gifsList;
      } else {
        throw Exception('Error del servidor ${response.statusCode}');
      }
    } catch (e) {
      print('Error al hacer la solicitud HTTP: $e');
      throw Exception('Error en la solicitud HTTP: $e');
    }
  }
}
