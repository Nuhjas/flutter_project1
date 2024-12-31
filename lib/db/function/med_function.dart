import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newapp/db/model/model.dart';

abstract class addMedfunction{

  Future<void> insertMed (addMedicineModel value1) ;
  Future <List<addMedicineModel>>getMedDetails();


}

class addMedDb implements addMedfunction{

  addMedDb._internal();

  static addMedDb instance1 = addMedDb._internal();

  factory addMedDb(){

    return instance1;

  }
  ValueNotifier<List<addMedicineModel>>addNotifier = ValueNotifier([]);
  @override
  Future<void> insertMed(addMedicineModel value1) async{
    
    final _MedDb = await Hive.openBox <addMedicineModel>('NameDb');
    await _MedDb.put(value1.Key2?.toString(), value1);
    await refreashUi();
  } 

  
  @override
  Future<List<addMedicineModel>> getMedDetails() async{
    final _MedDb = await Hive.openBox <addMedicineModel>('NameDb');
    return _MedDb.values.toList(growable: true);

  }

   Future<void>refreashUi() async{
   final _listadd = await getMedDetails();
   //_listadd.sort( (a, b) => a.Key1!.compareTo(b.Key1!));
   addNotifier.value.clear();
   
   addNotifier.value.addAll(_listadd);
   addNotifier.notifyListeners();
}

}