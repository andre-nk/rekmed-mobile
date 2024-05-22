import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';

class DoctorProfilePicture extends StatelessWidget {
  const DoctorProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Data Dokter"),
      body: Padding(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.4,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 175,
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage('assets/doctor-profile-1.jpeg'),
                        fit: BoxFit
                            .cover, // This will ensure the image covers the container properly
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Background color
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(4), // Rounded corners
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      elevation: 0, // Shadow
                    ),
                    child: Text(
                      'Ganti Foto Profil',
                      style: TextStyle(
                        fontSize: 12, // Font size
                        color: Colors.black, // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DoctorProfilePicture(),
  ));
}
