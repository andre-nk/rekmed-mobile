import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

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
      selectedItemColor: const Color(0xFF05CAD5),
      unselectedItemColor: const Color(0xFF868484),
      onTap: onItemTapped,
    );
  }
}
