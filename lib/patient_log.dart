import 'package:flutter/material.dart';
import 'package:newapp/patient_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class patientlog extends StatelessWidget {
  patientlog({super.key});

  final _usercontrolp = TextEditingController();
  final _passcontrolp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
            height: 400,
            width: 350,
            color: Color.fromARGB(255, 243, 243, 243),
            child: Column(
              children: [
                Text(
                  'Patient Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 116, 3, 3),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _usercontrolp,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passcontrolp,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     
                    ElevatedButton.icon(
                      onPressed: () {
                        patuserandpass(context);
                      },
                      icon: Icon(Icons.login_rounded),
                      label: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   Future<void> patuserandpass(BuildContext ctx) async {
    final _user = _usercontrolp.text.trim();
    final _pass = _passcontrolp.text.trim();
    if (_user.isEmpty || _pass.isEmpty) {
 
      return;
    } else {
      Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
        return patientscr1();
      }
      ),
      (route) => false
      );
    }
  }
}
