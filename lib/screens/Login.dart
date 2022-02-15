import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/screens/Minh.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/sinup.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //formkey
  final _formkey = GlobalKey<FormState>();

  // editController
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // email field
    final email = TextFormField(
      autocorrect: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("please Enter your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter your email");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "emaill",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
      ),
    );
    final pass = TextFormField(
      autocorrect: false,
      controller: _passController,
      obscureText: true,
      //validatar
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for  Login");
        }
        if (!regExp.hasMatch(value)) {
          return ("please Enter  valid password(Min.6 ");
        }
        return null;
      },
      onSaved: (value) {
        _passController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),

          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Pass",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
      ),
    );
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        onPressed: () {
          signIn(_emailController.text, _passController.text);
        },
        child:
        Text("Login", textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),

      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Asfsa"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.white,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 12,),
                    email,
                    SizedBox(height: 12,),
                    pass,
                    SizedBox(height: 12,),
                    loginbutton,
                    SizedBox(height: 22,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("chuwa co tafi khoan"),
                        GestureDetector(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Sinup()));
                          },
                          child: Text("Sigup",
                            style: TextStyle(color: Colors.red),),
                        )
                      ],
                    )
                  ],),),
            ),
          ),
        ),
      ),
    );
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "login successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Homescreen())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}