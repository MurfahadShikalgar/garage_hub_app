
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyAccountDetails();
  }

  void getMyAccountDetails(){
    setState(() {
      var uid = FirebaseAuth.instance.currentUser.uid;
      FirebaseFirestore.instance.collection('Garages').doc(uid).snapshots().listen((event) {
        setState(() {
          password= event.data()['Password'];
          registerDate = event.data()['Date of Registration'];
          referenceNo = event.data()['Reference No.'];
          subscriptionType= event.data()['Type of Subscription'];
          owner = event.data()['Owner Name'];
          validity = event.data()['validity'];
        });
    });
    });
  }
  String validity="";
  String owner ="";
  String password= "";
  String registerDate = "";
  String referenceNo ="";
  String subscriptionType="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios , size: 25 , color:  buttonColour,),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        title: Text("Subscription" ,style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold , color:  Colors.black),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12,8,12,8),
              child: Container(
                height: 230,
                width: MediaQuery.of(context).size.width ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14,8,8,8),
                        child: Text("Dr.Spanner" , style:  TextStyle( fontWeight: FontWeight.bold, fontSize: 25 , color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,8,12,8),
                        child: Text("$subscriptionType" , style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color(0xffc7f520)),),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12,8,8,8),
                    child: Text("Card Holder Name:" , style:  TextStyle( fontWeight: FontWeight.w300, fontSize: 20 , color: backColour1), ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,8,8),
                    child: Center(child: Text("$owner" , style:  TextStyle( fontWeight: FontWeight.w400, fontSize: 25 , color: backColour1), )),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,8,30,8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          children: [
                            Text("MNF/DATE" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white54),),
                            Text("$registerDate" ,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),),
                          ],
                        ),

                        Column(
                          children: [
                            Text("EXP/DATE" , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white54),),
                            Text("$validity" ,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),),
                          ],
                        ),

                        Column(
                          children: [
                            Text("REF/No." , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white54),),
                            Text("$referenceNo" ,  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(19)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                    offset: Offset(5, 5)
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.purple , Colors.blue],
                ),
              ),
              ),
            ),
        ],
      ),
    );
  }
}
