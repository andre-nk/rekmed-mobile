import 'package:flutter/material.dart';
import 'package:rekmed/model/doctor/doctor.dart';
import 'package:rekmed/view/screens/doctor/DoctorProfilePage.dart';

class DoctorListTile extends StatelessWidget {
  final Doctor doctor;
  const DoctorListTile({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DoctorProfilePage(doctor: doctor);
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32.0,
              backgroundImage: NetworkImage(doctor.profilePicture),
            ),
            const SizedBox(width: 24.0), // Add this line (1/2)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4.0),
                Text(doctor.id ?? "")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
