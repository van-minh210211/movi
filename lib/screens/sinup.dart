import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login/model/Usermodel.dart';
import 'package:login/screens/Login.dart';
import 'package:login/screens/home.dart';
class Sinup extends StatefulWidget {
  @override
  _SinupState createState() => _SinupState();
}

class _SinupState extends State<Sinup> {
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final fistNameedittingController = new TextEditingController();
  final seconddittingController = new TextEditingController();
  final emailedittingController = new TextEditingController();
  final passwordedittingController = new TextEditingController();
  final comfimedittingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final fistname = TextFormField(
    //   autocorrect: false,
    //   controller: fistNameedittingController,
    //   keyboardType: TextInputType.name,
    //   validator: (value) {
    //     RegExp regex = new RegExp(r'^.{3,}$');
    //     if (value!.isEmpty) {
    //       return ("First Name cannot be Empty");
    //     }
    //     if (!regex.hasMatch(value)) {
    //       return ("Enter Valid name(Min. 3 Character)");
    //     }
    //     return null;
    //   },
    //   onSaved: (value)
    //   {
    //     fistNameedittingController.text=value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.mail),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "firtname",
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
    //   ),
    // );
    // final secondd = TextFormField(
    //   obscureText: true,
    //   autocorrect: false,
    //   controller: seconddittingController,
    //   keyboardType: TextInputType.name,
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return ("Second Name cannot be Empty");
    //     }
    //     return null;
    //   },
    //   onSaved: (value)
    //   {
    //     seconddittingController.text=value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.mail),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "seconddname",
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
    //   ),
    // );
    // final Emaileditting = TextFormField(
    //   obscureText: true,
    //   autocorrect: false,
    //   controller: emailedittingController,
    //   keyboardType: TextInputType.emailAddress,
    //   validator: (value) {
    //     if (value!.isEmpty) {
    //       return ("Please Enter Your Email");
    //     }
    //     // reg expression for email validation
    //     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
    //         .hasMatch(value)) {
    //       return ("Please Enter a valid email");
    //     }
    //     return null;
    //   },
    //   onSaved: (value)
    //   {
    //     emailedittingController.text=value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.mail),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "emaill",
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
    //   ),
    // );
    // final passeditting = TextFormField(
    //   autocorrect: false,
    //   controller: passwordedittingController,
    //   keyboardType: TextInputType.emailAddress,
    //   validator: (value) {
    //     RegExp regex = new RegExp(r'^.{6,}$');
    //     if (value!.isEmpty) {
    //       return ("Password is required for login");
    //     }
    //     if (!regex.hasMatch(value)) {
    //       return ("Enter Valid Password(Min. 6 Character)");
    //     }
    //   },
    //   onSaved: (value)
    //   {
    //     passwordedittingController.text=value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.mail),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "pass wword",
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
    //   ),
    // );
    // final comfim = TextFormField(
    //   autocorrect: false,
    //   controller: comfimedittingController,
    //   keyboardType: TextInputType.emailAddress,
    //   validator: (value) {
    //     if (comfimedittingController.text !=
    //         passwordedittingController.text) {
    //       return "Password don't match";
    //     }
    //     return null;
    //   },
    //   onSaved: (value)
    //   {
    //     comfimedittingController.text=value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //       prefixIcon: Icon(Icons.mail),
    //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //       hintText: "comfim password",
    //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
    //   ),
    // );
    // final  sinupbutton = Material(
    //   elevation: 5,
    //   borderRadius:  BorderRadius.circular(30),
    //   color: Colors.redAccent,
    //   child: MaterialButton(
    //     padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     minWidth: MediaQuery.of(context).size.width,
    //     onPressed: (){
    //       signUp(emailedittingController.text,passwordedittingController.text);
    //     },
    //     child:
    //     Text("Login",textAlign:  TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),),
    //
    //   ),
    // );
    final firstNameField = TextFormField(
        autofocus: false,
        controller: fistNameedittingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          fistNameedittingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: seconddittingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          seconddittingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailedittingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          fistNameedittingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordedittingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          fistNameedittingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus: false,
        controller: comfimedittingController,
        obscureText: true,
        validator: (value) {
          if (comfimedittingController.text !=
              passwordedittingController.text) {
            return "Password don't match";
          }
          return null;
        },
        onSaved: (value) {
          comfimedittingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signUp(emailedittingController.text, passwordedittingController.text);

          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
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
   backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(36),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    firstNameField,
                    SizedBox(height: 20),
                    secondNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signUp ( String email, String password)async{
    if(_formkey.currentState!.validate()){
     await _auth.createUserWithEmailAndPassword(email: email, password: password)
         .then((value) =>{
     postDeatilsToFirebasestore()
    }).catchError((e)
     {
      Fluttertoast.showToast(msg: e!.message);
     });
  }
}

  postDeatilsToFirebasestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = fistNameedittingController.text;
    userModel.secondName = seconddittingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Homescreen()),
            (route) => false);
  }
}
