import 'package:flutter/material.dart';
import 'package:warmindo_tugas/fetch_data_pengguna.dart';
import 'package:warmindo_tugas/fetch_data_role.dart';
import 'package:warmindo_tugas/insert_data_pengguna.dart';
import 'package:warmindo_tugas/insert_data_role.dart';

class ManajemenDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manajemen Data"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Data Warung
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPenggunaInsert(),
                    ),
                  );
                },
                child: Text("Tambah Data Pengguna"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Data Warung
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPenggunaFetch(),
                    ),
                  );
                },
                child: Text("Data Pengguna"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Data Transaksi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataRoleInsert(),
                    ),
                  );
                },
                child: Text("Tambah Data Role"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Data Warung
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataRoleFetch(),
                    ),
                  );
                },
                child: Text("Data Role"),
              ),
            ],
          ),
        ),
      )
    );
  }
}
