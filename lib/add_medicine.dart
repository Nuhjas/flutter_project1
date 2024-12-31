

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/db/function/med_function.dart';
import 'package:newapp/db/model/model.dart';

class AddMedicine extends StatelessWidget {
   AddMedicine({super.key});

   final _medName = TextEditingController();
  final  _medMornig =TextEditingController();
  final  _medNoon =TextEditingController();
  final  _medEvening =TextEditingController();
  final  _medNight =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 30,right: 30),
      
     
        
        
        child: Column(
          
          children: [

            Padding(padding:  EdgeInsets.only(left: 20,right: 20),
              
           // Container(
              
              
              child: Text('Add Medicine Details',
               
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30,),
            // Row(
            //   children: [
            //    // Text('Enter Medicine Name'),
            //   ],
            //),
            
            TextFormField(
              controller: _medName,
              decoration: const InputDecoration(
                hintText: 'Enter Medicine Name',
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                  // controller: ,
            ),
            
            SizedBox(height: 20,),
            Text('Enter Time', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold), ),
            SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Morning',
                          border: OutlineInputBorder()
                           ),
                            controller: _medMornig,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(child: TextFormField(decoration: const InputDecoration(
                          hintText: 'Noon',
                          border: OutlineInputBorder()
                    ),
                     controller: _medNoon,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(decoration: const InputDecoration(
                                hintText: 'Evening',
                                border: OutlineInputBorder()
                          ),
                           controller:_medEvening ,
                          ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextFormField(decoration: const InputDecoration(
                            hintText: 'Night',
                            border: OutlineInputBorder()
                      ),
                       controller: _medNight ,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: (){
                     medicine();
                     addMedDb.instance1.refreashUi();
                  }, 
                  child: Text('Save')),
              ],
            )
          ],
          
          ),
       
       
       
        );
   
  }

  Future<void> medicine() async{

    final morning = _medMornig.text;
    final noon = _medNoon.text;
    final evening = _medEvening.text;
    final night = _medNight.text;
    final _medicinename = _medName.text.trim();
    final _parsMorg = double.tryParse(morning);

    final _medTime = addMedicineModel(
      MedName:  _medicinename,
      MedMornig: _parsMorg,
      MedNoon: double.tryParse(noon),
      MedEvening: double.tryParse(evening),
      MedNight: double.tryParse(night),
      Key2: DateTime.now().millisecond.toInt(),
      

    );
    addMedDb.instance1.insertMed(_medTime);
  }
}