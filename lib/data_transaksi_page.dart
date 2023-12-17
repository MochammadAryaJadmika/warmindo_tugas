import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DataTransaksiPage extends StatefulWidget {
  const DataTransaksiPage({Key? key}) : super(key: key);

  @override
  State<DataTransaksiPage> createState() => _DataTransaksiState();
}

class _DataTransaksiState extends State<DataTransaksiPage> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Transaksi');

  Widget ListItem({required Map transaksi}){
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 180,
      color: Color.fromARGB(255, 217, 192, 226),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID Transaksi: ${transaksi['kodetransaksi'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Nama Pelanggan: ${transaksi['namapelanggan'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Tanggal dan Waktu Transaksi: ${transaksi['tgl_waktu'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Total Transaksi: ${transaksi['totaltransaksi'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Metode Pembayaran: ${transaksi['mtd_pembayaran'].toString()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Shift: ${transaksi['shift'].toString()}",
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
        title: const Text('Data Transaksi'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){

            Map transaksi = snapshot.value as Map;
            transaksi['key'] = snapshot.key;

            return ListItem(transaksi: transaksi);
          },
        ),

      ),
    );
  }
}

  

