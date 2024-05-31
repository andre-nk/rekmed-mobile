import 'package:flutter/material.dart';
import 'package:rekmed/view/screens/doctor/DoctorProfilePage.dart';
import 'package:rekmed/view/screens/home/Home.dart';
import 'package:rekmed/view/widgets/navigation/BottomNavBar.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int _selectedIndex = 0; //deklarasi variabel
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? const HomePage() : const DoctorProfilePage(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
