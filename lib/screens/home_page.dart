import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya'), actions: [
        IconButton(icon: const Icon(Icons.logout), onPressed: () => FirebaseAuth.instance.signOut())
      ]),
      body: user == null
          ? const Center(child: Text('User tidak ditemukan.'))
          : StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return const Center(child: Text('Data profil tidak ditemukan.'));
                }
                var userData = snapshot.data!.data() as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      ListTile(leading: const Icon(Icons.person), title: const Text("Nama"), subtitle: Text(userData['fullName'] ?? '')),
                      ListTile(leading: const Icon(Icons.cake), title: const Text("Umur"), subtitle: Text(userData['age']?.toString() ?? '')),
                      ListTile(leading: const Icon(Icons.wc), title: const Text("Jenis Kelamin"), subtitle: Text(userData['gender'] ?? '')),
                      ListTile(leading: const Icon(Icons.phone), title: const Text("Nomor HP"), subtitle: Text(userData['phoneNumber'] ?? '')),
                    ],
                  ),
                );
              },
            ),
    );
  }
}