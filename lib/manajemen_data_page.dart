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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuCard(
                context,
                "Data Pengguna",
                "Lihat Detail",
                () {
                  // Navigasi ke halaman detail data pengguna
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPenggunaFetch(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildMenuCard(
                context,
                "Data Role",
                "Lihat Detail",
                () {
                  // Navigasi ke halaman detail data role
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataRoleFetch(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildMenuCard(
                context,
                "Tambah Pengguna",
                "Tambah",
                () {
                  // Navigasi ke halaman tambah pengguna
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPenggunaInsert(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildMenuCard(
                context,
                "Tambah Role",
                "Tambah",
                () {
                  // Navigasi ke halaman tambah role
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataRoleInsert(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String menuTitle, String buttonLabel, VoidCallback onPressed) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(menuTitle),
        trailing: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonLabel),
        ),
      ),
    );
  }
}