import 'package:flutter/material.dart';

import 'login.dart';

class patientscr1 extends StatelessWidget {
  const patientscr1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Patient'),
        actions: [
          IconButton(onPressed: (){
            signout(context);
          }, icon: Icon(Icons.logout_sharp ),)
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
            title: Text('person$index'),
            subtitle: Text('disese'),
          )
          ),
           separatorBuilder: ((context, index) {
            return Divider();
           }
           ),
           itemCount: 3),
           ),
    );
  }
  signout(BuildContext ctx){
    Navigator.of(ctx).pushAndRemoveUntil(
    MaterialPageRoute(builder: (ctx)=>(Loginscreen()),
    ), 
      (route) => false);
  }
}