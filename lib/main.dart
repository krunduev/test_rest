import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List listOfProducts = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    var url = Uri.https('dummyjson.com', 'products');
    var response = await http.get(url);
    Map valueMap = json.decode(response.body);
    listOfProducts = valueMap["products"] as List;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: listOfProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listOfProducts[index]["title"]),
            subtitle: Text("\$${listOfProducts[index]["price"]}"), // "${myVariable}"
            onTap: (){

            },
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                // TODO - delete item
                // delete(index);
              },
            ),
          );
        },
      ),
    );
  }
}
