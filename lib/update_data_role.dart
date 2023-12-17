import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class UpdateDataRole extends StatefulWidget {
  
  const UpdateDataRole({Key? key, required this.roleKey}) : super(key: key);
 
  final String roleKey;
 
  @override
  State<UpdateDataRole> createState() => _UpdateDataRoleState();
}
 
class _UpdateDataRoleState extends State<UpdateDataRole> {

  final  userIdRoleController= TextEditingController();
  final  userRoleController =TextEditingController();
  final  userStatusController= TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Role');
    getRoleData();
  }
 
  void getRoleData() async {
    DataSnapshot snapshot = await dbRef.child(widget.roleKey).get();
 
    Map role = snapshot.value as Map;
 
    userIdRoleController.text = role['idrole'];
    userRoleController.text = role['role'];
    userStatusController.text = role['status'];
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Role'),
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
                  'Edit Data Role Warmindo Inspirasi Indonesia',
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
                      hintText: 'masukkan id role',
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
                      hintText: 'Masukkan role',
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
  
                    Map<String, String> role = {
                      'idrole': userIdRoleController.text,
                      'role': userRoleController.text,
                      'status': userStatusController.text
                      };
  
                    dbRef.child(widget.roleKey).update(role)
                    .then((value) => {
                      Navigator.pop(context) 
                    });
  
                  },
                  child: const Text('Update Data'),
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