import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:login/model/movied.dart';
import 'package:http/http.dart' as http;

class Movise extends ChangeNotifier{
  final String _url = 'https://api.themoviedb.org/3/movie/popular?api_key=de12635d45ec2b89efc8fe1243055ab4';
  Future <Movied> fetchMovi () async{
    final response = await http.get(Uri.parse(_url));
    if( response.statusCode == 200){
      return Movied.fromJson(jsonDecode(response.body));
    }else{
      throw Exception(response.statusCode);
    }
  }
}