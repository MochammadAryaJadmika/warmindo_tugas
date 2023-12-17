import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:warmindo_tugas/update_data_pengguna.dart';

class DataPenggunaFetch extends StatefulWidget {
  const DataPenggunaFetch({Key? key}) : super(key: key);

  @override
  State<DataPenggunaFetch> createState() => _DataPenggunaFetchState();
}

class _DataPenggunaFetchState extends State<DataPenggunaFetch> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Pengguna');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Pengguna');

  Widget ListItem({required Map pengguna}){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Color.fromARGB(255, 187, 184, 183),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID Pengguna: ${pengguna['idpengguna'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "ID Role: ${pengguna['idrole'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Username: ${pengguna['username'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Nama Pengguna: ${pengguna['namapengguna'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Status: ${pengguna['status'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateDataPengguna(penggunaKey:pengguna['key'])));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                GestureDetector(
                  onTap: () {
                    reference.child(pengguna['key']).remove();
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
        title: const Text('Data Pengguna'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

            Map pengguna = snapshot.value as Map;
            pengguna['key'] = snapshot.key;

            return ListItem(pengguna: pengguna);
          },
        ),

      ),
    );
  }
}

  

