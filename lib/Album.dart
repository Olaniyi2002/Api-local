import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;
  Album({this.id, this.userId, this.title});

  // factory Album.fromJson(Map<String, dynamic> json) {
  //   return Album(userId: json['userId'], id: json['id'], title: json['title']);
  // }
  factory Album.formJson(Map<String, dynamic> json) {
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }
}

class Network {
  Future<Album> fetchAlbum() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/albums/1');
    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }
}
