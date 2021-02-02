import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class HistoryTable extends StatefulWidget {
  final Index;
  const HistoryTable ({ this.Index});
  @override
  _HistoryTableState createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJobCardHistoryDetails();
  }
  void getJobCardHistoryDetails(){
    var currentUid= FirebaseAuth.instance.currentUser.uid;
//print(currentUid);
    FirebaseFirestore.instance.collection('Garages').doc(currentUid).get().then((value) {
      jobCard= value.data()['Job Card'];
      print(jobCard);
    }).whenComplete(() {
      setState(() {
        JobCardDetails = jobCard;
      });
    });
  }
var jobCard;
  List  JobCardDetails=List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: Text("History" , style:  TextStyle( fontWeight: FontWeight.bold, fontSize: 25, color: buttonColour),),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 25,color: buttonColour,),
            onPressed: ()=>Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
          children:<Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Job Card",textScaleFactor: 2,style: TextStyle(fontWeight:FontWeight.bold , color: Colors.grey),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,15,8,0),
              child: Table(

                textDirection: TextDirection.ltr,
                border:TableBorder.all(width: 1.0,color: Colors.red),
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Customer Name",textScaleFactor: 1.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(JobCardDetails[widget.Index]['Customer Name'],textScaleFactor: 1.5,),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Customer Mob No.",textScaleFactor: 1.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(JobCardDetails[widget.Index]['Customer Mob No.'],textScaleFactor: 1.5,),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Date",textScaleFactor: 1.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(JobCardDetails[widget.Index]['Date'],textScaleFactor: 1.5,),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Vehicle No.",textScaleFactor: 1.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(JobCardDetails[widget.Index]['Vehicle No'],textScaleFactor: 1.5,),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Vehicle Type",textScaleFactor: 1.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(JobCardDetails[widget.Index]['Vehicle Type'],textScaleFactor: 1.5,),
                        ),
                      ]
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}
