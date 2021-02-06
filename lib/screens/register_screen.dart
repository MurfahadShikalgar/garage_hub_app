

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/Widgets/loader.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/helperFunction.dart';
import 'package:garagehubapp/screens/selection_screen.dart';
import 'package:toast/toast.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  HelperFunction _helperFunction = HelperFunction();

  TextEditingController garageNameController=TextEditingController();
  TextEditingController ownerNameController=TextEditingController();
  TextEditingController garageTypeController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController mobileNoController=TextEditingController();
  TextEditingController websiteNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  bool spinner=false;
  var items = ['Car', 'Bike', 'Both'];
  var itemsSubsciption = ['Basic', 'Standard', 'Premium'];
  var uid;





  @override
  Widget build(BuildContext context) {

    var width = _helperFunction.getWidth(context);
    var height = _helperFunction.getHeight(context);
    return Scaffold(

        appBar: AppBar(
          backgroundColor: backColour,
          elevation: 3,
         leading: IconButton(icon: Icon(Icons.arrow_back , size: 30,color: Color(0xff122be3),),onPressed: ()=>Navigator.pop(context),),
          title: Text("Register Garage" ,style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 18 ,color: Colors.black54),),
        ),
      backgroundColor: backColour,
      body: SingleChildScrollView(
       child: Stack(
          children: [
          Column(
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
                      hintText: 'Vehicle Type',
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
                    decoration: decorationTextField.copyWith(hintText: "Your Website URL"),
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
                    child: Text("${_helperFunction.getDate()}", style: TextStyle( fontWeight:  FontWeight.w400,fontSize: 17, color: Colors.grey),),
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
            loader(spinner: spinner, height: height , width: width)
          ],
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
      spinner = true;

    });

    setState(() {

      var garageName = garageNameController.text.trim();
      var ownerName = ownerNameController.text.trim();
      var garageType = garageTypeController.text;
      var address = addressController.text.trim();
      var mobileNo = mobileNoController.text.trim();
      var websiteName = websiteNameController.text.trim();
      var emailId = emailController.text.trim();
      var password = passwordController.text.trim();

      if(garageName == ""){
        setState(() {
          spinner = false;

        });

        Toast.show("Garage Name Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(ownerName == "" ){
        setState(() {
          spinner = false;

        });

        Toast.show("Owner Name Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(garageType == ""){
        setState(() {
          spinner = false;

        });

        Toast.show("Garage Type Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(address == ""){
        setState(() {
          spinner = false;

        });

        Toast.show("Address Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(mobileNo == ""){
        setState(() {
          spinner = false;

        });

        Toast.show("Mobile No. Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(emailId == ""){
        setState(() {
          spinner = false;

        });

        Toast.show("Email Id Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else if(password == ""){
        setState(() {
          spinner = false;

        });

        Toast.show("Password Cannot be Empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }else {

        Toast.show(
            "Adding data to database", context, duration: Toast.LENGTH_SHORT,
            gravity: Toast.CENTER);
        setState(() {
          spinner = true;

        });


        Map <String, dynamic>data = {
          kGarageName: garageName,
          kOwnerName: ownerName,
          kGarageType: garageType,
          kAddress: address,
          kMobileNumber: mobileNo,
          kReferenceNumber: mobileNoController.text.substring(6, 10),
          kWebsiteUrl: websiteName,
          kDateOfReg: _helperFunction.getDate(),
          kSubscriptionType: "",
          kEmail: emailId,
          kPassword: password,
          kUid: uid,
          kValidity: "",
          kJobCard: [],
          kGarageLogo: "",
          kNumberOfVehicles: 0,
          kDeviceIds : "",
          kPushId : "",
          kTranscationHistory : [],
          kSmsDetails : {},


        };

        FirebaseFirestore.instance.collection(kGarages).doc(uid)
            .set(data)
            .whenComplete(() {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SelectionScreen()));
          setState(() {
            spinner = false;
          });
          clearData();
        });
      }
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
      emailController.text="";
      passwordController.text="";
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    garageNameController.dispose();
    ownerNameController.dispose();
    garageTypeController.dispose();
    addressController.dispose();
    mobileNoController.dispose();
    websiteNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


}


