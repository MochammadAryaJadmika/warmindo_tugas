import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class UpdateDataPengguna extends StatefulWidget {
  
  const UpdateDataPengguna({Key? key, required this.penggunaKey}) : super(key: key);
 
  final String penggunaKey;
 
  @override
  State<UpdateDataPengguna> createState() => _UpdateDataPenggunaState();
}
 
class _UpdateDataPenggunaState extends State<UpdateDataPengguna> {
 
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
    getPenggunaData();
  }
 
  void getPenggunaData() async {
    DataSnapshot snapshot = await dbRef.child(widget.penggunaKey).get();
 
    Map pengguna = snapshot.value as Map;
 
    userIdPenggunaController.text = pengguna['idpengguna'];
    userIdRoleController.text = pengguna['idrole'];
    userUsernameController.text = pengguna['username'];
    userNamaPenggunaController.text = pengguna['namapengguna'];
    userStatusController.text = pengguna['status'];
 
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Pengguna'),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Edit Data Pengguna Warmindo Inspirasi Indonesia',
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
  
                    dbRef.child(widget.penggunaKey).update(pengguna)
                    .then((value) => {
                      Navigator.pop(context) 
                    });
  
                  },
                  child: const Text('Update Data'),
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