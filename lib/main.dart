import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Local JSON App'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          child: Center(
            //*Used to fetch data
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/person.json'),
              builder: (context, snapshot) {
                //*Decoding the JSON
                var myData = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemCount: myData == null ? 0 : myData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("User ID : " + myData[index]['userId']),
                          Text('Title : ' + myData[index]['title']),
                          Text('Body : ' + myData[index]['body']),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}
