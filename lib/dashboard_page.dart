import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warmindo_tugas/login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    String? _email = _auth.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logged In With: $_email"),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                      ));
                },
                child: Text("SignOut"),
              ),
            ],
          ),
        ),
      )
    );
  }
}