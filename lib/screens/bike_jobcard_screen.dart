import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../const.dart';

class BikeJobcardScreen extends StatefulWidget {
  @override
  _BikeJobcardScreenState createState() => _BikeJobcardScreenState();
}

class _BikeJobcardScreenState extends State<BikeJobcardScreen> {
  TextEditingController customerNameController= TextEditingController();
  TextEditingController customerMobNoController= TextEditingController();
  TextEditingController vehicleNoController= TextEditingController();
  TextEditingController vehicleTypeController= TextEditingController();
  TextEditingController addressController= TextEditingController();
  String finalString="";
  var dateTimeNow=DateTime.now().millisecondsSinceEpoch;
  int value=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDate();
    print(finalString);
  }
  bool spinner= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 25,color: buttonColour,),
            onPressed: ()=>Navigator.pop(context), ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.logout,color: buttonColour,), onPressed: (){
            FirebaseAuth.instance.signOut().whenComplete(() {
              Navigator.pop(context);
            });
          }),
        ],
        title: Text("Bike Details" , style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,color: buttonColour),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:15,),
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
                    controller: customerNameController,
                    decoration: decorationTextField.copyWith(hintText: "Customer Name"),
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
                    controller: customerMobNoController,
                    decoration: decorationTextField.copyWith(hintText: "Customer Mob No."),
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
                    controller: vehicleNoController,
                    decoration: decorationTextField.copyWith(hintText: "Vehicle No."),
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
                    controller: vehicleTypeController,
                    decoration: decorationTextField.copyWith(hintText: "Vehicle Type"),
                  ),
                ),
              ),
              GestureDetector(
                child: Padding (
                  padding: const EdgeInsets.fromLTRB(10,2,10,8),
                  child: Container(
                    width: MediaQuery.of(context).size.width *8,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18,24,0,0),
                      child: Text("${finalString}", style: TextStyle( fontWeight:  FontWeight.w400,fontSize: 17, color: Colors.grey),),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
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
                onTap: (){


                },
              ),




              Padding(
                padding: const EdgeInsets.fromLTRB(8,10,8,8),
                child: GestureDetector(
                  child: Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width-40,
                    child: Center(child: Text("Create Job" ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),)),
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
                    print("before $value");
                    updateJobCard();
                    setState(() {
                      value++;
                      print("after $value");
                    });
                  },
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  void updateJobCard()async{
    setState(() {
      spinner=true;
    });
    var uid= await FirebaseAuth.instance.currentUser.uid;
    print("uid is");
    print(uid);
    setState(() {
      Map <String, dynamic>data={
        'Customer Name': customerNameController.text,
        'Customer Mob No.': customerMobNoController.text,
        'Vehicle No': vehicleNoController.text,
        'Vehicle Type': vehicleTypeController.text,
        'TimeStamp': dateTimeNow,
        'Date': finalString,
      };


      setState(() {
        var list=[data];
        FirebaseFirestore.instance.collection('Garages').doc(uid).update({
          'Job Card': FieldValue.arrayUnion(list),
        });
        spinner = false;
      });

    });
    clearData();
  }
  void clearData(){
    setState(() {
      customerNameController.text="";
      customerMobNoController.text="";
      vehicleNoController.text="";
      vehicleTypeController.text="";
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

}

