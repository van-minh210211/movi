import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/model/movied.dart';
import 'package:login/screens/Login.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/network/Movi.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Movise()),
            
        ],
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
    );
  }
}
