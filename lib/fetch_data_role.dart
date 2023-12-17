import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:warmindo_tugas/update_data_pengguna.dart';
import 'package:warmindo_tugas/update_data_role.dart';

class DataRoleFetch extends StatefulWidget {
  const DataRoleFetch({Key? key}) : super(key: key);

  @override
  State<DataRoleFetch> createState() => _DataRoleFetchState();
}

class _DataRoleFetchState extends State<DataRoleFetch> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Role');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Role');

  Widget ListItem({required Map role}){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 140,
      color: Color.fromARGB(255, 217, 192, 226),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID Role: ${role['idrole'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Role: ${role['role'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Status: ${role['status'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateDataRole(roleKey:role['key'])));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 88, 102, 108) 
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    reference.child(role['key']).remove();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red[700],
                      ),
                    ],
                  ),
                ),
              ],
            )   
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Role'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

            Map role = snapshot.value as Map;
            role['key'] = snapshot.key;

            return ListItem(role: role);
          },
        ),

      ),
    );
  }
}

  

