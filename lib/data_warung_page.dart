import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      height: 150,
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
              "Nama Warung: ${warung['namawarung'].toString()}",
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
              "Lokasi: ${warung['lokasi'].toString()}",
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
              "Alamat: ${warung['alamat'].toString()}",
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
              "Jumlah Karyawan: ${warung['jmlhkaryawan'].toString()}",
              style: GoogleFonts.poppins(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
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

            Map warung = snapshot.value as Map;
            warung['key'] = snapshot.key;

            return ListItem(warung: warung);
          },
        ),

      ),
    );
  }
}