import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/album.dart';

Future<Album> getAlbuns() async {
    final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    return Future.error("Ops! Um erro ocorreu.");
  }
}