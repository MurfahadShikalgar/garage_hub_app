import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/Widgets/loader.dart';
import 'package:garagehubapp/helperFunction.dart';

import '../const.dart';

class PendingJobs extends StatefulWidget {
  @override
  _PendingJobsState createState() => _PendingJobsState();
}

class _PendingJobsState extends State<PendingJobs> {


  List  jobCardDetails = [];
  var jobCard;
  bool spinner = false;
  HelperFunction _helperFunction = HelperFunction();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPendingJobCardDetails();
  }



  void getPendingJobCardDetails() async {
  var currentUid = await FirebaseAuth.instance.currentUser.uid;

   FirebaseFirestore.instance.collection(kGarages).doc(currentUid).get().then((value) {
     jobCard = value.data()[kJobCard];
     print(jobCard);
     setState(() {
       jobCardDetails = jobCard;
     });
   }).catchError((e){});
  }



  @override
  Widget build(BuildContext context) {
    var width = _helperFunction.getWidth(context);
    var height = _helperFunction.getHeight(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 25,color: buttonColour,),
            onPressed: ()=>Navigator.pop(context),
          ),
        ),
        title: Text("Pending Jobs" , style:  TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,color: buttonColour),),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          jobCardDetails != null ?
          Expanded(
            child: ListView.builder(
              itemCount: jobCardDetails.length,
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  child: Container(
                    color:Colors.white,
                    height: 100,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,8,0,8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                           Text(jobCardDetails[index][kCustomerName], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.grey),),
                            SizedBox(height: 10,),
                            Text(jobCardDetails[index][kVehicleNumber].toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                            Text(jobCardDetails[index][kVehicleType].toString(),style: TextStyle(fontSize: 15,color: Colors.black),),

                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  onTap: (){


                    },
                );

              },
            ),
          ) : loader(spinner: spinner, height: height, width: width)
        ],
      ),
    );
  }
}
