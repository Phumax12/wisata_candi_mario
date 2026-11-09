import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/providers/favorite_provider.dart';
import 'package:wisata_candi/providers/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = true; // Set true untuk demo/testing tampilan terisi
  String fullName = 'Muhammad Rachmadi'; 
  String userName = 'rachmadi'; 

  // TODO: 5. Implementasi fungsi signIn
  void signIn() {
    setState(() {
      isSignedIn = true; 
    });
  }

  // TODO: 6. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // Memantau nilai favorit dari Provider di dalam method build yang valid
    final favoriteCount = context.watch<FavoriteProvider>().count;
    final auth = context.watch<AuthProvider>();


    return Scaffold(
      body: Stack(
        children: [
          // Latar ungu di bagian atas
          Container(
            height: 200, 
            width: double.infinity, 
            color: Colors.deepPurple, 
          ),
          // Isi Layar Utama
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), 
            child: Column(
              children: [
                // TODO: 2. Buat ProfileHeader (foto profil dan ikon kamera)
                Align(
                  alignment: Alignment.topCenter, 
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50), 
                    child: Stack(
                      alignment: Alignment.bottomRight, 
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ), 
                            shape: BoxShape.circle, 
                          ),
                          child: const CircleAvatar(
                            radius: 50, 
                            backgroundImage: AssetImage(
                              'images/placeholder_image.png',
                            ), 
                          ),
                        ),
                        if (isSignedIn) 
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50], 
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // TODO: 3. Buat ProfileInfo (info pengguna: Pengguna, Nama, Favorit)
                // Baris 1: Pengguna
                ProfileInfoItem(
                  icon: Icons.lock,
                  iconColor: Colors.amber,
                  label: 'Pengguna',
                  value: isSignedIn ? userName : '',
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                // Baris 2: Nama
                ProfileInfoItem(
                  icon: Icons.person,
                  iconColor: Colors.blue,
                  label: 'Nama',
                  value: isSignedIn ? fullName : '',
                  showEditIcon: isSignedIn,
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                const SizedBox(height: 4),

                // Baris 3: Favorit
                ProfileInfoItem(
                  icon: Icons.favorite,
                  iconColor: Colors.red,
                  label: 'Favorit',
                  value: isSignedIn ? '$favoriteCount' : '0',
                ),
                const SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]), 
                const SizedBox(height: 20), 
                
                // TODO: 4. Buat ProfileActions (tombol Sign In / Sign Out)
                auth.isSignedIn
                    ? TextButton(
                        onPressed: signOut, 
                        child: const Text('Sign Out'), 
                      )
                    : TextButton(
                        onPressed: signIn, 
                        child: const Text('Sign In'), 
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget kustom komponen baris info profil agar kode di atas bersih & terstruktur
class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final bool showEditIcon;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.showEditIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3, 
          child: Row(
            children: [
              Icon(icon, color: iconColor), 
              const SizedBox(width: 8), 
              Text(
                label, 
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), 
              ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            ': $value', 
            style: const TextStyle(fontSize: 18), 
          ),
        ),
        if (showEditIcon) const Icon(Icons.edit),
      ],
    );
  }
}
