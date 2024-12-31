import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newapp/login.dart';
import 'package:newapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/function/function.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState(){
    goScreen2();
    

  
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    addDetailDb.instance.refreashUi;
    return Scaffold(
       body: Container(
         child: Center(
           child: const Text(
                  'Health Monitor',
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 237, 1, 1),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  )
             ),
         ),
       ),
    );
  }
  Future<void>goScreen2() async{
  Timer(Duration(seconds: 4), () { 
      
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx)=>Loginscreen(),
        ),
      );
    }
    );
}
 Future<void>checklogin() async{
    final _sharedpref = await SharedPreferences.getInstance();
    final userlogged = _sharedpref.getBool(SAVE_KEY);
    if(userlogged==null|| userlogged==false)
    {
      goScreen2();
    }
    else
    {

    }
  }
}
