import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class BlogPost extends StatefulWidget{
  @override
  BlogPostState createState() => new BlogPostState();
}

class BlogPostState extends State<BlogPost>{
  List data;
  Future<String> getDate() async{
    http.Response response = await http.get(
      Uri.encodeFull('http://192.168.1.112:8080/wp-json/wp/v2/posts'),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState((){
      data = jsonDecode(response.body);
    });
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Text("hahahahaha");
  }

}