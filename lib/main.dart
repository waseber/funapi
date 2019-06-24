import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;



void main() => runApp(
  new MaterialApp(
    home: new HomePage(),
    routes: <String, WidgetBuilder>{
      "/SecondPage": (BuildContext context) => new SecondPage()
    },
  )
);

class HomePage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;
  Future<String> getData() async{
    http.Response response = await http.get(
      Uri.encodeFull("http://192.168.1.112/blog-api/wp-json/wp/v2/posts"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
      data = jsonDecode(response.body);
    });
    
    //print(data);

    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("JAMES"),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.share, color: Colors.blue),
                iconSize: 70.0,
                onPressed: () {Navigator.of(context).pushNamed('/SecondPage');},
              ),
              new Text("Number 2"),
              new Expanded(
                child: new ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      child: new Text(data[index]['title']['rendered']),
                    );
                  },
                ),
              )
            ]
        ) 
      )
      )
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: new Text("JUDE"),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.home, color: Colors.greenAccent,),
                iconSize: 70.0,
                onPressed: () {Navigator.of(context).pushNamed('/');},
              )
            ],
          ),
        ),
      ),
    );
  }
}
