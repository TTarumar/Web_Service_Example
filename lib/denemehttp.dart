import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:deneme4/models/gonderi.dart';
import 'dart:async';
import 'dart:convert';

class denemehttp extends StatefulWidget {
  @override
  _denemehttpState createState() => _denemehttpState();
}

class _denemehttpState extends State<denemehttp> {
  Gonderi gonderi;

  Future<List<Gonderi>> _gonderigetir() async {
    var response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Gonderi.fromJsonMap(tekGonderiMap))
          .toList();
    } else {
      throw Exception("Bağlantı hatası ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _gonderigetir(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].body),
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text(snapshot.data[index].id.toString(),style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
