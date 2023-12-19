import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warmindo_tugas/data_transaksi_page.dart';
import 'package:warmindo_tugas/data_warung_page.dart';
// import 'package:warmindo/login_page.dart';
import 'package:warmindo_tugas/manajemen_data_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    String? _email = _auth.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logged In With: $_email"),
              SizedBox(
                height: 50,
              ),

              _buildMenuCard(
                context,
                "Data Warung",
                "Lihat",
                () {
                  // Navigasi ke halaman detail data pengguna
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataWarungPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildMenuCard(
                context,
                "Data Transaksi",
                "Lihat",
                () {
                  // Navigasi ke halaman detail data role
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataTransaksiPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              _buildMenuCard(
                context,
                "Manajemen Data",
                "Lihat",
                () {
                  // Navigasi ke halaman tambah pengguna
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManajemenDataPage(),
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