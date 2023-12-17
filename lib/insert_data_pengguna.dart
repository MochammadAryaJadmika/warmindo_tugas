import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DataPenggunaInsert extends StatefulWidget {
  const DataPenggunaInsert({Key? key}) : super(key: key);

  @override
  State<DataPenggunaInsert> createState() => _DataPenggunaState();
}

class _DataPenggunaState extends State<DataPenggunaInsert> {
  final  userIdPenggunaController = TextEditingController();
  final  userIdRoleController= TextEditingController();
  final  userUsernameController =TextEditingController();
  final  userNamaPenggunaController =TextEditingController();
  final  userStatusController= TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Pengguna');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pengguna'),
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
                  'Masukkan Data Pengguna Warmindo Inspirasi Indonesia',
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
                  controller: userIdPenggunaController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID Pengguna',
                    hintText: 'Masukkan id pengguna',
                  ),
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
                    hintText: 'masukkan id role',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: userUsernameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Masukkan username',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: userNamaPenggunaController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Pengguna',
                    hintText: 'Masukkan nama pengguna',
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
                    labelText: 'Status Pengguna',
                    hintText: 'Masukkan status',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    Map<String, String> pengguna = {
                      'idpengguna': userIdPenggunaController.text,
                      'idrole': userIdRoleController.text,
                      'username': userUsernameController.text,
                      'namapengguna': userNamaPenggunaController.text,
                      'status': userStatusController.text
                    };
  
                    dbRef.push().set(pengguna);

                    // Mengosongkan kolom setelah data di-submit
                    userIdPenggunaController.clear();
                    userIdRoleController.clear();
                    userUsernameController.clear();
                    userNamaPenggunaController.clear();
                    userStatusController.clear();
  
                  },
                  child: const Text('Submit Data Pengguna'),
                  color: Color.fromARGB(255, 187, 133, 207),
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