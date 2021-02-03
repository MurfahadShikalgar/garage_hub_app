import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class PendingJobs extends StatefulWidget {
  @override
  _PendingJobsState createState() => _PendingJobsState();
}

class _PendingJobsState extends State<PendingJobs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPendingJobCardDetails();
  }
  void getPendingJobCardDetails(){
var currentUid= FirebaseAuth.instance.currentUser.uid;
//print(currentUid);
   FirebaseFirestore.instance.collection('garages').doc(currentUid).get().then((value) {
     jobCard= value.data()['jobCard'];
     print(jobCard);
   }).whenComplete(() {
     setState(() {
       JobCardDetails = jobCard;
     });
   });
  }


  List  JobCardDetails=List();

var jobCard;
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              itemCount: JobCardDetails.length,
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

                           Text(JobCardDetails[index]['customerName'], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.grey),),
                            SizedBox(height: 10,),
                            Text(JobCardDetails[index]['vehicleNo'].toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                            Text(JobCardDetails[index]['vehicleType'].toString(),style: TextStyle(fontSize: 15,color: Colors.black),),

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
          ),
        ],
      ),
    );
  }
}
