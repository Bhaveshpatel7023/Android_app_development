import 'package:flutter/material.dart';
import 'package:flutter_application_1/Language.dart';
import 'package:flutter_application_1/Number.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   
    
    MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.b612().fontFamily,
      ),
      
      
      routes:{
  
       "/":(context) =>  const Mylanguage(),
       "/verify":(context) => Mynumber(),
      // "/OTP":(context) => OTP()
      }
    );
    
  }
}