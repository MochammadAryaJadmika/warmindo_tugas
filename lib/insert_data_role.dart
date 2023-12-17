import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DataRoleInsert extends StatefulWidget {
  const DataRoleInsert({Key? key}) : super(key: key);

  @override
  State<DataRoleInsert> createState() => _DataRoleState();
}

class _DataRoleState extends State<DataRoleInsert> {
  final  userIdRoleController= TextEditingController();
  final  userRoleController =TextEditingController();
  final  userStatusController= TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Role');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Role'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Masukkan Data Role Warmindo Inspirasi Indonesia',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: userIdRoleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID Role',
                    hintText: 'Masukkan id role',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: userRoleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Role',
                    hintText: 'masukkan role',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: userStatusController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Status Role',
                    hintText: 'Masukkan status',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> role = {
                      'idrole': userIdRoleController.text,
                      'role': userRoleController.text,
                      'status': userStatusController.text
                    };
  
                    dbRef.push().set(role);

                    // Mengosongkan kolom setelah data di-submit
                    userIdRoleController.clear();
                    userRoleController.clear();
                    userStatusController.clear();
  
                  },
                  child: const Text('Submit Data Role'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  minWidth: 300,
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}