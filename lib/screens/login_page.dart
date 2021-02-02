import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/alert_screen.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/screens/register_screen.dart';
import 'package:garagehubapp/screens/selection_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  bool spinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(child: Image.asset ("images/loginLogo.jpg", height: 300,)),
              Text("Login" , style: TextStyle( fontWeight: FontWeight.w500 ,fontSize: 30,color: buttonColour),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width-20,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        //icon: Icon(Icons.email,size: 30,),
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blue),
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width-20,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        //icon: Icon(Icons.email,size: 30,),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blue),
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width-170,
                    child: Center(child: Text("Login" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [buttonColour , nextButton],
                      ),
                    ),
                  ),
                  onTap: (){
                   logIntoAccount();
                  },
                ),
              ),
              Text("If dont have an Account" , style: TextStyle(fontSize: 10 ,fontWeight: FontWeight.bold ,color: Colors.black),),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Register" , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold , color:  Color(0xff122be3)),),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logIntoAccount(){
    setState(() {
      spinner=true;
    });
    var email=emailController.text;
    var password=passwordController.text;
    if(email!="" && password!=""){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).
      then((value) {
        setState(() {
          spinner=false;
        });
        var user=value.user;
        if(user!=null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectionScreen()));
        }
      }).catchError((error){
        setState(() {
          spinner=false;
          AlertScreen(context, AlertType.error, "Error", "$error", "Ok", Colors.red);
        });
        print("error login user into server ${error}");
      });

    }
    else{
      setState(() {
        spinner=false;
      });
      AlertScreen(context, AlertType.error, "Error", "error", "ok",Colors.red);
    }
  }
}
