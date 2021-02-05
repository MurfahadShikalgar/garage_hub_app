import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/screens/History_table.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {


  List  jobCardDetails = [];
  var jobCard;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      getHistoryDetails();
    }
  }
  void getHistoryDetails()async {
    var currentUid = await FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection(kGarages).doc(currentUid).get().then((value) {
      jobCard = value.data()[kJobCard];
      print(jobCard);
      setState(() {
        jobCardDetails = jobCard;
      });
    }).catchError((e){

    });

  }


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
        children: [
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
                    var Index= index;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HistoryTable(jobCardDetails: jobCardDetails[index],)));

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
