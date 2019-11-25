import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async{
  List _data = await getJson();
  print("title"+ _data[1]['title']);
  String _body ="";

  for(int i=0; i< _data.length; i++){
    print("Title:"+ _data[i]['title']);
    print("Body:"+_data[i]['body']);
  }
  _body = _data[0]['body'];
  runApp(new MaterialApp(
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text('JSON Parse.') ,
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,

      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _data.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int position){
              if(position.isOdd) return new Divider();
              return new ListTile(
                title: new Text("${_data[position]['title']}",
                  style: new TextStyle(fontSize: 18.9)),
                subtitle: new Text("${_data[position]['body']}",
                style: new TextStyle(fontSize: 13.4,
                color:Colors.grey,
                fontStyle: FontStyle.italic),),
                leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Text("${_data[position]['body'][0].toString().toUpperCase()}",
                 style: new TextStyle(fontSize: 13.4,color: Colors.orangeAccent),
                ),
              )
              );
            })
      ),
    ),
  ));
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(apiUrl);

  return  json.decode(response.body);
}
