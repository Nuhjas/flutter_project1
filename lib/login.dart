import 'package:flutter/material.dart';
import 'package:newapp/official_log.dart';
import 'package:newapp/patient_log.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          color: Color.fromARGB(134, 255, 255, 255),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(
                height: 90,
              ),
              Center(
                child: Text(
                  'Login As',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 218, 130, 124),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    onPressed: () {
                       Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx){
                            return Screen2();
                          } 
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.local_hospital_outlined,
                      size: 80,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 100,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx){
                            return patientlog();
                          } 
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.person_2_outlined,
                      size: 80,
                      color: Colors.red,
                      
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
