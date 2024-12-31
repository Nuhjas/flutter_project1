import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newapp/db/model/model.dart';
import 'db/function/function.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';

const SAVE_KEY = 'userlogin'; 
Future <void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.getInstance();
  await  Hive.initFlutter();
  addDetailDb.instance;
  

  if(!Hive.isAdapterRegistered(addDetailModelAdapter().typeId)){

    Hive.registerAdapter(addDetailModelAdapter());
  }

  runApp  (const MyApp());
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Screen1(),
      routes: {
        'screen2': (ctx) {
          return Loginscreen();
        },
      },
    );
  }
  
}
