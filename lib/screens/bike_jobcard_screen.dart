import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/helperFunction.dart';
import 'package:toast/toast.dart';

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


  var dateTimeNow = DateTime.now().millisecondsSinceEpoch;
  int value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

        ],
        title: Text("Bike Details" , style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,color: buttonColour),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
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
                      child: Text("${HelperFunction().getDate()}", style: TextStyle( fontWeight:  FontWeight.w400,fontSize: 17, color: Colors.grey),),
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

                    if(customerNameController.text == ""){
                      Toast.show("Name cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }else if(customerMobNoController.text.length < 10){
                      Toast.show("Mobile number in valid", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    } else if(vehicleNoController.text == ""){
                      Toast.show("Vehicle number cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }else if(vehicleTypeController.text == ""){
                      Toast.show("Vehicle type cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    }else{
                      updateJobCard();
                    }

                  },
                ),
              ),


            ],
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
      Map <String, dynamic>data = {
        kCustomerName: customerNameController.text.trim(),
        kCustomerMobileNumber: customerMobNoController.text.trim(),
        kVehicleNumber: vehicleNoController.text.trim(),
        kVehicleType: vehicleTypeController.text.trim(),
        kTimeStamp: dateTimeNow,
        kDate: HelperFunction().getDate(),
      };

      setState(() {
        var list=[data];
        FirebaseFirestore.instance.collection(kGarages).doc(uid).update({
          kJobCard : FieldValue.arrayUnion(list),
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



}

