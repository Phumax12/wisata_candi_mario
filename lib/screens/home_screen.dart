import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/providers/favorite_provider.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/search_screen.dart';
import 'package:wisata_candi/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  Widget _buildGrid(List<Candi> candis) {
    if (candis.isEmpty) {
      return const Center(child: Text('Belum ada candi favorit'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1.03,
      ),
      itemCount: candis.length,
      itemBuilder: (context, index) => ItemCard(candi: candis[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = switch (_selectedIndex) {
      0 => 'Wisata Candi',
      2 => 'Favorit',
      _ => null,
    };

    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title),
              backgroundColor: Colors.deepPurple[50],
              surfaceTintColor: Colors.transparent,
              elevation: 0,
            ),
      body: switch (_selectedIndex) {
        0 => _buildGrid(candiList),
        1 => const SearchScreen(),
        2 => _buildGrid(
          candiList
              .where(
                (candi) =>
                    context.watch<FavoriteProvider>().isFavorite(candi.name),
              )
              .toList(),
        ),
        _ => const ProfileScreen(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple[50],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple[300],
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}