import 'package:flutter/material.dart';
import 'package:visite/Background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _emailcontroller=TextEditingController();
  final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[

        Scaffold(
        
          body: Form( 
            child:SafeArea(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
            TextField(
              
                    controller: _emailcontroller,
                    cursorColor: Colors.white,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: 'Email', ),
                    
                  ),
                  SizedBox(
                    height: 20,

                  ),

                  ElevatedButton(style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    backgroundColor: Color.fromARGB(207, 32, 35, 61),
                    foregroundColor: Colors.white70
                  ),
                  
                  child: Text('Forgot Password',
                  style: TextStyle(fontSize: 24),),
                  onPressed:(){
                    auth.sendPasswordResetEmail(email: _emailcontroller.text.toString()).then((value){
                      Fluttertoast.showToast(msg:'We have sent you an email to recover password.');
                    }).onError((error, stackTrace){
                      Fluttertoast.showToast(msg: error.toString());
                    });
                  } ,
                  ),]
          )
        )
        ))
      ]
      
    );
  }
}



