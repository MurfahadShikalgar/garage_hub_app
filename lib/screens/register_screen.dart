

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/screens/selection_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController garageNameController=TextEditingController();
  TextEditingController ownerNameController=TextEditingController();
  TextEditingController garageTypeController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController mobileNoController=TextEditingController();
  TextEditingController websiteNameController=TextEditingController();
  TextEditingController subscriptionTypeController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool spinner=false;
  var items = ['Car', 'Bike', 'Both'];
  var itemsSubsciption = ['Basic', 'Standard', 'Premium'];
  var uid;
  String finalString="";
  String validity="";
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
    getValidity();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: backColour,
          elevation: 3,
         leading: IconButton(icon: Icon(Icons.arrow_back , size: 30,color: Color(0xff122be3),),onPressed: ()=>Navigator.pop(context),),
          title: Text("Register Garage" ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18 ,color: Colors.black54),),
        ),
      backgroundColor: backColour,
      body: ModalProgressHUD(
        inAsyncCall: spinner ,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                  ),
                  child: TextField(
                    controller: garageNameController,
                    decoration: decorationTextField.copyWith(hintText: "Garage Name"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: ownerNameController,
                    decoration: decorationTextField.copyWith(hintText: "Owner Name"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child:  TextField(
                    controller: garageTypeController,

                    decoration:InputDecoration(
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          garageTypeController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Select',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ) ,

                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: addressController,
                    decoration: decorationTextField.copyWith(hintText: "Address"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: mobileNoController,
                    decoration: decorationTextField.copyWith(hintText: "Mobile No."),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: websiteNameController,
                    decoration: decorationTextField.copyWith(hintText: "Your Website Name"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18,24,0,0),
                    child: Text("${finalString}", style: TextStyle( fontWeight:  FontWeight.w400,fontSize: 17, color: Colors.grey),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: subscriptionTypeController,
                    decoration: InputDecoration(
                      suffixIcon: PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          subscriptionTypeController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return itemsSubsciption
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Select Subscription Type',
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: decorationTextField.copyWith(hintText: "Email Id"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,2,10,8),
                child: Container(
                  width: MediaQuery.of(context).size.width *8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: decorationTextField.copyWith(hintText: "Password"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8,10,8,8),
                child: GestureDetector(
                  child: Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width-40,
                    child: Center(child: Text("Register" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [ nextButton , buttonColour],
                      ),
                    ),
                  ),
                  onTap: (){
                    createUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createUser(){
    String email= emailController.text;
    String password= passwordController.text;

    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      var user = value.user;
      uid= user.uid;
      addDataToDatabase(uid);
      print("registered");
      print(uid);
    });

  }

  void addDataToDatabase(String uid){
    setState(() {
      var garageName=garageNameController.text;
      var ownerName=ownerNameController.text;
      var garageType=garageTypeController.text;
      var address=addressController.text;
      var mobileNo= mobileNoController.text;
      var websiteName= websiteNameController.text;
      var subscriptionType= subscriptionTypeController.text;
      var emailId= emailController.text;
      var password= passwordController.text;
      if(garageName==""){
        Toast.show("Garage Name Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(ownerName==""){
        Toast.show("Owner Name Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(garageType==""){
        Toast.show("Garage Type Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(address==""){
        Toast.show("Address Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(mobileNo==""){
        Toast.show("Mobile No. Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(websiteName==""){
        Toast.show("Website Name Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(subscriptionType==""){
        Toast.show("Subscription Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(emailId==""){
        Toast.show("Email Id Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(password==""){
        Toast.show("Password Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else {
        Toast.show("Adding data to database", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.CENTER);
        spinner=true;
      }

      Map <String ,dynamic>data ={
        "Garage Name":garageNameController.text,
        "Owner Name": ownerNameController.text,
        "Type of Garage" : garageTypeController.text,
        "Address" : addressController.text,
        "Mobile No.": mobileNoController.text,
        "Reference No." : mobileNoController.text.substring(6,10),
        "Website Name": websiteNameController.text,
        "Date of Registration": finalString,
        "Type of Subscription" : subscriptionTypeController.text,
        "Email Id" :emailController.text,
        "Password" : passwordController.text,
        "uid" : uid,
        "validity": validity,
        "Job Card":[],

      };

      FirebaseFirestore.instance.collection("Garages").doc(uid).set(data).whenComplete(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectionScreen()));
        setState(() {
          spinner=false;
        });
        clearData();
      });
    });
  }

  void clearData(){
    setState(() {
      garageNameController.text="";
      ownerNameController.text="";
      garageTypeController.text="";
      addressController.text="";
      mobileNoController.text="";
      websiteNameController.text="";
      subscriptionTypeController.text="";
      emailController.text="";
      passwordController.text="";
    });
  }
  void getDate(){
    var date= DateTime.now().toString();
    var dateParse= DateTime.parse(date);
    var formattedDate=  "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    setState(() {
      finalString= formattedDate.toString();
    });
  }

  void getValidity(){
    var date= DateTime.now().toString();
    var dateParse= DateTime.parse(date);
    var formattedDate=  "${dateParse.day}-${dateParse.month+1}-${dateParse.year}";
    setState(() {
      validity= formattedDate.toString();
    });
  }

}


