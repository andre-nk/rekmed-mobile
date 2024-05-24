import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Pasien',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.medical_services), label: 'Dokter'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Akun'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFF05CAD5),
      unselectedItemColor: Color(0xFF868484),
      onTap: onItemTapped,
    );
  }
}
