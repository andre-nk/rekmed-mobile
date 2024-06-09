import 'package:flutter/material.dart';
import 'package:rekmed/model/patient/patient.dart';
import 'package:rekmed/view/screens/patient/PatientProfilePage.dart';

class PatientListTile extends StatelessWidget {
  final Patient patient;
  const PatientListTile({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PatientProfilePage(patient: patient);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient.name,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4.0),
            Text(patient.id ?? "")
          ],
        ),
      ),
    );
  }
}
