import 'package:flutter/material.dart';
import 'package:rekmed/view/screens/clinic/ClinicProfilePage.dart';
import 'package:rekmed/view/screens/home/DoctorListPage.dart';
import 'package:rekmed/view/screens/home/HomePage.dart';
import 'package:rekmed/view/screens/home/PatientListPage.dart';
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
      body: _selectedIndex == 0
          ? const HomePage()
          : _selectedIndex == 1
              ? const PatientListPage()
              : _selectedIndex == 2
                  ? const DoctorListPage()
                  : _selectedIndex == 3
                      ? const ClinicProfilePage()
                      : const HomePage(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
