import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: const InputDecoration(
        labelText: 'Cari dokter, pasien, rekam medis...',
        filled: false,
        suffixIcon: Icon(Icons.search),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
