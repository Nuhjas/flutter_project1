import 'package:flutter/material.dart';
import 'package:newapp/doctor_screen.dart';
import 'package:newapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen2 extends StatefulWidget {
  Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _usercontrold = TextEditingController();

  final _passcontrold = TextEditingController();
  final bool _check = false;
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
                  'Official Login',
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
                  controller: _usercontrold,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passcontrold,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: _check,
                      child: Text(
                        'Wrong Username or Password',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        docuserandpass(context);
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

  Future<void> docuserandpass(BuildContext ctx) async {
    final _user = _usercontrold.text.trim();
    final _pass = _passcontrold.text.trim();
    if(_user == null)
    {
      return;
    }
    if(_pass == null)
    {
      return;
    }
    if (_user.isEmpty || _pass.isEmpty) {
 // setState(() {
 //   _check= false;
 // });
      return;
    } else {
      Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
        return doctorscr1();
      }
      ),
      (route)=> false,
      );
    }
  }
}
