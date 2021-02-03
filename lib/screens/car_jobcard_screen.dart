

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/Widgets/loader.dart';
import 'package:garagehubapp/alert_screen.dart';
import 'package:garagehubapp/helperFunction.dart';
import 'package:garagehubapp/screens/pending_jobs.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../const.dart';

class CarJobcardScreen extends StatefulWidget {

  @override
  _CarJobcardScreenState createState() => _CarJobcardScreenState();
}

class _CarJobcardScreenState extends State<CarJobcardScreen> {

  TextEditingController customerNameController= TextEditingController();
  TextEditingController customerMobNoController= TextEditingController();
  TextEditingController vehicleNoController= TextEditingController();
  TextEditingController vehicleTypeController= TextEditingController();
  TextEditingController addressController= TextEditingController();

  HelperFunction _helperFunction = HelperFunction();
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


  bool spinner=false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Car Service', style: kAppBarTextStyle,),
        backgroundColor: kLightBlue,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart, size: 25, color: Colors.black,), onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PendingJobs()))),

        ],
      ),

      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('images/BG_4.png', width: width,height: height, fit: BoxFit.cover,),
          SingleChildScrollView(
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
//                      gradient: LinearGradient(
//                        begin: Alignment.centerLeft,
//                        end: Alignment.centerRight,
//                        colors: [Colors.blue , Colors.blue[100]],
//                      ),
                    color: Colors.black45
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
          loader(spinner: spinner, height: height, width: width),
        ],
      ),
    );
  }

  void updateJobCard()async{
    setState(() {
      spinner= true;
    });
   var uid= await FirebaseAuth.instance.currentUser.uid;
   print("uid is");
   print(uid);
   setState(() {
     Map <String, dynamic> data={
       'customerName': customerNameController.text,
       'ustomerMobNo': customerMobNoController.text,
       'vehicleNo': vehicleNoController.text,
       'vehicleType': vehicleTypeController.text,
       'timestamp': dateTimeNow,
       'date': finalString,
     };


      setState(() {
        var list=[data];
        FirebaseFirestore.instance.collection('garages').doc(uid).update({
          'jobCard': FieldValue.arrayUnion(list),
        }).then((value){
          clearData();
          sendCreateJobMessage();
        }).catchError((e){
          setState(() {
            spinner = false;

          });
          AlertScreen(context, AlertType.error, "Error", "${e}", "OK", Colors.red);
        });
        spinner= false;
      });

   });
  }

  void sendCreateJobMessage(){

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
