import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

const bgColor= Color.fromARGB(255, 0, 0, 0);
const bgSecondaryColor= Color(0xff1b1b1b);

const myPrimaryColor= Color(0xff4549FE);
const mySecondaryColor= Color(0xffC3D4FF);

const greyTextColor= Color(0xff969696);

TextStyle regular13GreyText=GoogleFonts.poppins(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400);
TextStyle regular13WhiteText=GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,shadows: [
                Shadow(
                    offset: Offset(4, 3),
                    blurRadius: 20,
                    color: Colors.black45,
                ),
            ],);
TextStyle regular15WhiteText=GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400,shadows: [
                Shadow(
                    offset: Offset(4, 3),
                    blurRadius: 20,
                    color: Colors.black45,
                ),
            ],);
TextStyle regular16WhiteBoldText=GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500);
TextStyle regular15WhiteBoldText=GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500 ,shadows: [
                Shadow(
                    offset: Offset(4, 3),
                    blurRadius: 20,
                    color: Colors.black45,
                ),
            ],);
TextStyle regular15GreyText=GoogleFonts.poppins(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w400);
TextStyle big23BlackText=GoogleFonts.poppins(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w600);
TextStyle regular18WhiteText=GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400);
TextStyle big18GreyText=GoogleFonts.poppins(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w400);
TextStyle big18WhiteText=GoogleFonts.poppins(color:Colors.white,fontSize: 18,fontWeight: FontWeight.w600);
TextStyle big23WhiteText=GoogleFonts.poppins(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w600);
TextStyle big23regularWhiteText=GoogleFonts.poppins(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w400);
TextStyle big23SecondaryColorText=GoogleFonts.poppins(color: const Color(0xffC3D4FF),fontSize: 23,fontWeight: FontWeight.w600);
