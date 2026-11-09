import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/data/candi_data.dart'; // 1. Diperbaiki: Ditambahkan titik koma (;)
import 'package:wisata_candi/screens/detail_screen.dart'; // 2. Diperbaiki: Import DetailScreen sesuai lokasi filemu
import 'package:wisata_candi/providers/favorite_provider.dart';
import 'package:wisata_candi/providers/auth_provider.dart';

// 3. Diperbaiki: Fungsi main() utama diletakkan di luar class dengan MultiProvider
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DetailScreen(candi: candiList[1]),
    );
  }
}
