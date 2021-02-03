import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const buttonColour= Color(0xff365ed6);
const nextButton= Color(0xff082ca3);
const backColour=Color(0xfffcfcff);
const backColour1=Color(0xfff2faf9);
const cardColour1= Color(0xff306ac7);
const cardColour2= Color(0xff2766cc);

const kYellowColour = Color(0xfffccb00);
const kGreyColour = Color(0xffebecec);
const kRedColour = Color(0xffe71d36);
const kBrightYelloColour = Color(0xfffff952);
const kDarkBlue = Color(0xff054a91);
const kLightBlue = Color(0xffDAEDE9);

const kMainTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 40,
    color: kRedColour);


const kAppBarTextStyle = TextStyle(fontSize: 20, fontFamily: 'Montserrat',fontWeight: FontWeight.w600 ,color: Colors.black);

const decorationTextField= InputDecoration(

  fillColor: Colors.white,
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  ),
);


