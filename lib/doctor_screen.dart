import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newapp/add_patient_detail.dart';
import 'package:newapp/button.dart';
import 'package:newapp/db/function/function.dart';
import 'package:newapp/list.dart';
import 'package:newapp/login.dart';

import 'db/model/model.dart';

class doctorscr1 extends StatelessWidget {
  const doctorscr1({super.key});

  void initState() {
    addDetailDb.instance.refreashUi();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('doctor'),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.logout_sharp),
          ),
        ],
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: addDetailDb.instance.addNotifier,
              builder: (BuildContext context, List<addDetailModel> newmodel,
                  Widget? _) {
                return ListView.separated(
                  itemBuilder: ((context, index) {
                    final person = newmodel[index];
                    return Card (
                      child: ListTile(
                      title: Text(person.Name),
                      subtitle: Text(
                        person.Age.toString()
                      ),
                      trailing: IconButton(
                          onPressed: () 
                          {

                          }, 
                          icon: Icon(Icons.delete_outline)
                          ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) {
                            return listdoc(Name: person.Name, Age1: person.Age.toString(), gender1: person.Gender.toString(),
                            );
                          }),
                        );
                      },
                    ));
                  }),
                  separatorBuilder: ((context, index) {
                    return Divider();
                  }),
                  itemCount: newmodel.length,
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return addDetails();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  signout(BuildContext ctx) {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => (Loginscreen()),
        ),
        (route) => false);
  }
}
