import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DataWarungPage extends StatefulWidget {
  const DataWarungPage({Key? key}) : super(key: key);

  @override
  State<DataWarungPage> createState() => _DataWarungState();
}

class _DataWarungState extends State<DataWarungPage> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Warung');

  Widget ListItem({required Map warung}){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Color.fromARGB(255, 254, 138, 105),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama Warung: ${warung['namawarung'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Lokasi Warung: ${warung['lokasi'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Alamat Warung: ${warung['alamat'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Jumlah Karyawan: ${warung['jmlhkaryawan'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Warung'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

            Map warung = snapshot.value as Map;
            warung['key'] = snapshot.key;

            return ListItem(warung: warung);
          },
        ),

      ),
    );
  }
}

  

