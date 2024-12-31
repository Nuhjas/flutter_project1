import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/add_patient_detail.dart';

class button1 extends StatelessWidget {
  const button1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      IconButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return addDetails();
          },
          ),
          );
        },
        icon: Icon(Icons.add),),),
    );
  }
  }