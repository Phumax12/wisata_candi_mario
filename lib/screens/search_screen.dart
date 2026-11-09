import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
  }

class _SearchScreenState extends State<SearchScreen> {
  //Todo: 1. deklarasikan variable yang dibutuhkan
  List<Candi> _filteredCandis = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo: 2. buat appbar dengan judul pencarian candi
      appBar: AppBar(title: Text('pencarian candi'),),
      //todo: 3. buat bdoy berupa column
      body: Column(
        children: [
      //todo: 4. buat textfield pencarian sebagai anak dari ocolumn
      //todo: 5. buat Lstview hasil pencarian sebagai anak dari column
        ],
      )
      
    );
  }
}