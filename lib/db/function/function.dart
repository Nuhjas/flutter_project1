import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newapp/db/model/model.dart';

abstract class addDbFunction{

  Future <List<addDetailModel>>getDetails();
  Future<void> insertdetail(addDetailModel value);

}

class addDetailDb implements addDbFunction{

  addDetailDb._internal();
  static addDetailDb instance = addDetailDb._internal();  

  factory addDetailDb(){

    return instance;

  }


ValueNotifier<List<addDetailModel>>addNotifier = ValueNotifier([]);
  @override
  Future<void> insertdetail(addDetailModel value) async{
    final _detailDb = await Hive.openBox <addDetailModel>('NameDb');

    await _detailDb.put(value.Key1?.toString(), value);
   await refreashUi();
  }
  
  @override
  Future<List<addDetailModel>>getDetails() async{

  final _detailDb = await Hive.openBox <addDetailModel>('NameDb');
  return _detailDb.values.toList( growable: true);

    
  }

  Future<void>refreashUi() async{
   final _listadd = await getDetails();
   //_listadd.sort( (a, b) => a.Key1!.compareTo(b.Key1!));
   addNotifier.value.clear();
   
   addNotifier.value.addAll(_listadd);
   addNotifier.notifyListeners();
  }



}