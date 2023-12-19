import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 200,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 206, 167, 236),
        borderRadius: BorderRadius.circular(15.0), // Atur nilai sesuai keinginan
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID Transaksi: ${transaksi['kodetransaksi'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Shift: ${transaksi['shift'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Tanggal: ${transaksi['tgl_waktu'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
           
            const SizedBox(
              height: 5,
            ),
            Text(
              "Nama: ${transaksi['namapelanggan'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Metode Transaksi: ${transaksi['mtd_pembayaran'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Total Transaksi: ${transaksi['totaltransaksi'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Text(
            //   "Tanggal dan Waktu Transaksi: ${transaksi['tgl_waktu'].toString()}",
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            
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
        titleTextStyle: GoogleFonts.poppins(
          color: Color(0xFF000000),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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