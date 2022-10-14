import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Language.dart';
import 'package:firebase_auth/firebase_auth.dart';



enum MynumberScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FROM_STATE
}

class Mynumber extends StatefulWidget {
  const Mynumber({Key? key}) : super(key: key);

  @override
  State<Mynumber> createState() => _MynumberState();
}

class _MynumberState extends State<Mynumber> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController(); 

  MynumberScreen currentState = MynumberScreen.SHOW_MOBILE_ENTER_WIDGET;

    FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationID="";

  void signInWithPhoneAuthCred(AuthCredential PhoneAuthCredential) async
  {
    try{
      final authCred = await _auth.signInWithCredential(PhoneAuthCredential);
      if(authCred.user !=null){

        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Mylanguage()) );
      }
    }
    on FirebaseAuthException catch (e){

        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Some Error Occured. Try Again')));
    }
  }

  showMobilePhoneWidget(context){
  return Column(
    mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150,left: 20,right: 20),
            child: Text('Please Enter your mobile number',
            style:TextStyle(fontSize:25,
            fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: TextFormField(
                     decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon : Padding(
                  padding: EdgeInsets.only(right: 10,left: 5),
                  child: Image.asset('icons/flags/png/in.png', package: 'country_icons',
                  height: 5,
                  width: 3,
                  ),
                ),       
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
              controller: phoneController,
            
            ),
             
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                child:Text('Send OTP'),
                onPressed: () async{                  
                   await _auth.verifyPhoneNumber(
                      phoneNumber: "${phoneController.text}",
                      verificationCompleted: (PhoneAuthCredential) async{
                      },
                       verificationFailed: (verificationFailed){
                        print(verificationFailed);
                       }, 
                       codeSent: (verificationID,resendingToken)async{
                        setState(() {
                          currentState = MynumberScreen.SHOW_OTP_FROM_STATE;
                          this.verificationID = verificationID;
                        });
                       }, 
                       codeAutoRetrievalTimeout: (veificationID) async{

                       });     
                },
              ),
            )
        ]
        );
        
  }

    showMobileOtgWidget(context){
  return Column(
    mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150,left: 20,right: 20),
            child: Text('Please Enter your OTP',
            style:TextStyle(fontSize:25,
            fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: TextFormField(
                     decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon : Padding(
                  padding: EdgeInsets.only(right: 10,left: 5),
                 child: Image.asset('icons/flags/png/in.png', package: 'country_icons',
                  height: 5,
                  width: 3,
                  ),
                ),
              
              
              ),
              keyboardType: TextInputType.number,
              
              controller: otpController,
            
            ),
          ),
            
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                child:Text('Verify'),
                onPressed: (){
                   AuthCredential PhoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
                    },
              ),
            )
        ]
        );
        
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState == MynumberScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context):showMobilePhoneWidget(context),
    );
  }
  }
    
  


