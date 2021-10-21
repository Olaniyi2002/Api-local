import 'package:flutter/material.dart';
import 'package:login/Album.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Network network = Network();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder<Album>(
          future: network.fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.title,
                style: TextStyle(fontSize: 50),
              );
            } else if (snapshot.hasError) {
              return AlertDialog(
                title: Text(
                  'Network Error',
                  style: TextStyle(fontSize: 30, color: Colors.blue),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
