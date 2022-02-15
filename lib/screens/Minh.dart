import 'package:flutter/material.dart';
import 'package:login/model/Users.dart';
class Minh extends StatefulWidget {
  @override
  _MinhState createState() => _MinhState();
}

class _MinhState extends State<Minh> {
  late Future<Users> users;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Api Calls in Flutter'),
            centerTitle: true,
          ),
          body: Center(child: FutureBuilder<Users>(
              future: users,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return ListView(

                    children: <Widget>[
                      Text(snapshot.data!.name),
                      Text(snapshot.data!.email),
                      Text(snapshot.data!.username),
                    ],
                  );
                }else if (snapshot.hasError){
                  return Text(snapshot.error.toString());
                }else{
                  return CircularProgressIndicator();
                }
              }
          ),),
        ));
  }
}