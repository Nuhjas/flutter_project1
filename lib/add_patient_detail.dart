import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/db/model/model.dart';

import 'db/function/function.dart';

class addDetails extends StatefulWidget {
  addDetails({super.key});

  @override
  State<addDetails> createState() => _addDetailsState();
}

class _addDetailsState extends State<addDetails> {
  final _gender = [
    'Male',
    'Female',
    'Others',
  ];

  String? _select;

  String? __selectedGender;

  final _agecontroller = TextEditingController();

  final _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 40,
            right: 40,
            top: 20,
          ),
          child: Column(
            children: [
              Text(
                'Add Details',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
                controller: _namecontroller,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Age'),
                keyboardType: TextInputType.number,
                controller: _agecontroller,
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButtonFormField<String>(
                hint: const Text('Gender',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                value: _select,
                items: _gender.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e),
                    onTap: () {
                      __selectedGender = e ;
                    },
                  );
                }).toList(),
                onChanged: (selectvalue) {
                  setState(() {
                    _select = selectvalue;
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        //     final _sample= addDetailModel(Name: 'nj', Age: 2, Key1: DateTime.now().microsecondsSinceEpoch);
                        // addDetailDb().insertdetail(_sample);
                        // print(_sample);

                        //final _select1 = _select;
                        //print(_select);

                       detailscontroller();

                        Navigator.of(context).pop();
                        addDetailDb.instance.refreashUi();
                      },
                      child: Text('SAVE')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> detailscontroller() async {
    final  _age = _agecontroller.text;
    final _name = _namecontroller.text.trim();
    final _gender = _select;
    if (_select == null) {
      return;
    }
    final _parsedAge = double.tryParse(_age);
    if (_parsedAge == null) {
      return;
    }
    if (__selectedGender == null) {
      return;
    }
    if (_age == null || _name.isEmpty || _gender == null) {
      return;
    } else {
      final _details = addDetailModel(
        Name: _name,
        Age: _parsedAge,
        Key1: DateTime.now().millisecond.toInt(),
        Gender: __selectedGender!,
      );

      addDetailDb.instance.insertdetail(_details);
    }
  }
}
