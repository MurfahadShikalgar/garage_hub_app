

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyAccountDetails();
  }

  void getMyAccountDetails(){
    var uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('Garages').doc(uid).snapshots().listen((event) {
       password= event.data()['Password'];
       email =event.data()['Email Id'];
       owner = event.data()['Owner Name'];
       garageName = event.data()['Garage Name'];
       address = event.data()['Address'].toString();
       mobNo = event.data()['Mobile No.'];
       registerDate = event.data()['Date of Registration'];
       referenceNo = event.data()['Reference No.'];
       subscriptiontype= event.data()['Type of Subscription'];
      setState(() {

      });
    });
  }
  List myAccountDetails= List();
  String subscriptiontype= "";
  String referenceNo="";
  String password ="";
  String email= "";
  String owner="";
  String garageName ="";
  String address="";
  String mobNo="";
  String registerDate="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios ,size: 25 , color: buttonColour,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("My Account" , style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold ,color: Colors.black),),
      ),
      
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Icon (Icons.person_pin ,size: 130, color:  Colors.black,),
              SizedBox(width: 30,),
              Column(
                children: [
                  Text("$password" , style: TextStyle( fontWeight: FontWeight.w400 ,fontSize: 17),),
                  SizedBox(height: 5,),
                  Text("$email" , style: TextStyle( fontWeight: FontWeight.w400 ,fontSize: 17),),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width-45,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  color:Colors.white,
                  height: 500,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15,8,0,8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Owner Name" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                             // SizedBox(width: 160,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$owner", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Garage Name" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                             // SizedBox(width: 100,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$garageName", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Mobile No." , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                              // SizedBox(width: 100,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$mobNo", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Address" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                              // SizedBox(width: 100,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$address", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Registration Date" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                              // SizedBox(width: 100,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$registerDate", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Reference No" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                              // SizedBox(width: 100,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${referenceNo}", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Subscription"
                                    "" , style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                              ),
                              // SizedBox(width: 100,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("$subscriptiontype", style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18,color: Colors.grey),),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,18,8,8),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width-45,
                              color: Colors.grey,
                            ),
                          ),

                        ],
                      ),
                    ),


                    color: Colors.white,
                  ),
                );

              },
            ),
          ),

        ],
      ),
    );
  }
}
