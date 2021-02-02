
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garagehubapp/const.dart';
import 'package:garagehubapp/settings_screens/my_account.dart';
import 'package:garagehubapp/settings_screens/subscription_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  var gittokemn = "ff6e97d4ec5d9ed47fd6b200986151a71b0b3163";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 290,
            width: MediaQuery.of(context).size.width,
            child: Container(child: Image.asset("images/ava.png" ,),decoration: BoxDecoration(
              shape: BoxShape.circle
            ),),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
              color: buttonColour
            ),
          ),
       SizedBox(height: 20,),

       Padding(
       padding: const EdgeInsets.fromLTRB(10,2,10,8),
       child: InkWell(
         child: Container(
           width: MediaQuery.of(context).size.width *8,
             height: 70,
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon (Icons.person_pin, size: 40,color: Colors.black,),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(14,8,0,8),
                   child: Text("My Account" , style: TextStyle( fontWeight: FontWeight.w300, fontSize: 20 , color: Colors.black),),
                 ),
                  SizedBox(width: 155,),
                 Icon(Icons.navigate_next , size: 28 , color: Colors.blue,)
               ],
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(20)),
               color: Colors.white70,
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.3),
                   spreadRadius: 1,
                   blurRadius: 5,
                   offset: Offset(0, 3), // changes position of shadow
                 ),
               ],
             ),
         ),
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccount()));
         },
       ),
         ),
       Padding(
         padding: const EdgeInsets.fromLTRB(10,2,10,8),
         child: GestureDetector(
           child: Container(
             width: MediaQuery.of(context).size.width *8,
             height: 70,
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(12,8,8,8),
                   child: Icon (Icons.subscriptions, size: 30,color: Colors.redAccent,),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(18,8,0,8),
                   child: Text("Subscription" , style: TextStyle( fontWeight: FontWeight.w300, fontSize: 20 , color: Colors.black),),
                 ),
                 SizedBox(width: 150,),Icon(Icons.navigate_next , size: 28 , color: Colors.blue,)
               ],
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(20)),
               color: Colors.white70,
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.3),
                   spreadRadius: 1,
                   blurRadius: 5,
                   offset: Offset(0, 3), // changes position of shadow
                 ),
               ],
             ),
           ),
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionScreen()));
           },
         ),
       ),
       Padding(
         padding: const EdgeInsets.fromLTRB(10,2,10,8),
         child: Container(
           width: MediaQuery.of(context).size.width *8,
           height: 70,
           child: Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Icon (Icons.insert_chart, size: 40,color: Colors.green,),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(14,8,0,8),
                 child: Text("Statistics" , style: TextStyle( fontWeight: FontWeight.w300, fontSize: 20 , color: Colors.black),),
               ),
               SizedBox(width: 175,),Icon(Icons.navigate_next , size: 28 , color: Colors.blue,)
             ],
           ),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(20)),
             color: Colors.white70,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.3),
                 spreadRadius: 1,
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
           height: 70,
           child: Row(
             children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(12,8,8,8),
                 child: GestureDetector(child: Icon (Icons.logout, size: 35,color: Colors.red,
                 ),onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);

                 },),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(16,8,0,8),
                 child: Text("Log Out" , style: TextStyle( fontWeight: FontWeight.w300, fontSize: 20 , color: Colors.black),),
               ),
              // SizedBox(width: 150,),Icon(Icons.navigate_next , size: 28 , color: Colors.blue,)
             ],
           ),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(20)),
             color: Colors.white70,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.3),
                 spreadRadius: 1,
                 blurRadius: 5,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],
           ),
         ),
       ),
        ],
      ),
    );
  }
}
