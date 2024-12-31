import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/db/function/function.dart';

import 'add_medicine.dart';
import 'db/model/model.dart';

class listdoc extends StatelessWidget {
  final String Name;

  final String Age1;
  final String gender1;
  listdoc(
      {super.key,
      required this.Name,
      required this.Age1,
      required this.gender1});

  @override
  Widget build(BuildContext context) {
    //final age1 = _Age.value;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: 
                //final personlist = newmodel2.indexOf(addDetailModel(Name: Name, Age: Age, Key1: Key1, Gender: Gender))
                 Column(
                  children: [
                    Align(alignment: Alignment.topLeft,),
                    
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        
                        children: [
                          Text(
                            'Name: $Name',
                            style: const TextStyle(fontSize: 30),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Age: $Age1',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Gender: $gender1',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    
                     Expanded(
                      child: AddMedicine()
                      ),
                          
                    
                  ],
                  
                )
      ),
              
              
    );
  }
}
