
import 'package:hive_flutter/adapters.dart';
part 'model.g.dart';

@HiveType(typeId: 2)
class addMedicineModel{

  @HiveField(0)
  final String? MedName;

  @HiveField(1)
  final num? MedMornig;

  @HiveField(2)
  final num? MedNoon;

  @HiveField(3)
  final num? MedEvening;

  @HiveField(4)
  final num? MedNight;

  @HiveField(5)
  int? Key2;

  addMedicineModel({
    this.MedName, 
  this.MedMornig, 
  this.MedNoon, 
  this.MedEvening,
   this.MedNight,
   this.Key2,
   
})
   {
  Key2 =DateTime.now().millisecond.toInt();
 }
}

@HiveType(typeId: 1)
class addDetailModel{


  @HiveField(0)
  final String Name;

  @HiveField(1)
  final num? Age;


@HiveField(2)
   int? Key1;

  @HiveField(3)
  final String? Gender;

  @HiveField(4)
  final int? isDeleted;

addDetailModel({
  required this.Name,
required this.Age,
required this.Key1, 
required this.Gender,
 this.isDeleted,
 }){
  Key1 =DateTime.now().millisecond.toInt();
 }


}