
import 'dart:convert';
import 'package:login/model/Todo2.dart';

import 'network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:login/model/Todo.dart';
import 'package:login/model/movied.dart';
import 'Login.dart';
import 'package:http_parser/http_parser.dart' as http;
import 'package:http/http.dart' as http;
class Homescreen extends StatefulWidget {
  //

  @override
  _HomescreenState createState() => _HomescreenState();

}

class _HomescreenState extends State<Homescreen> {
  String title ="";
  late Future <Results> todo;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

//https://api.themoviedb.org/3/movie/popular?api_key=de12635d45ec2b89efc8fe1243055ab4https://jsonplaceholder.typicode.com/posts/1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.red,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          },
        ),
      ),
      body:

      Center(
        child:
          // FutureBuilder<Results>(
          //   future: todo,
          //   builder: (context,snapshot){
          //     if (snapshot.hasData){
          //       return Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children:<Widget> [
          //           Text(snapshot.data!.title),
          //         ],
          //       );
          //
          //     }else if(snapshot.hasError){
          //       return Text(snapshot.error.toString());
          //     }else{
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
        Column(
          children: <Widget>[

           Text("$title",style: TextStyle(fontSize: 12),),
            RaisedButton(onPressed: (){
              getUsers();
            },
            child: Text('check '),)

          ],
        ),
      ),
    );
  }

  Future<List<Movied>> getUsers() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=de12635d45ec2b89efc8fe1243055ab4'),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body[0]);
      final list = result["results"];
      return list.map((movi)=>Results.fromJson(movi)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

