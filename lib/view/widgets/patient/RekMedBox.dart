import 'package:flutter/material.dart';

class RekmedBox extends StatelessWidget {
  final String idRekamMedis;
  final String namaPasien;
  final String dokter;
  final DateTime tanggal;

  const RekmedBox(
      {super.key,
      required this.idRekamMedis,
      required this.namaPasien,
      required this.dokter,
      required this.tanggal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(idRekamMedis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              Text('${tanggal.day}/${tanggal.month}/${tanggal.year}',
                  style: const TextStyle(fontSize: 12.0)),
            ]),
            const SizedBox(height: 8.0),
            Text('Nama Pasien : $namaPasien', style: const TextStyle(fontSize: 12.0)),
            const SizedBox(height: 4.0),
            Text('Dokter : $dokter', style: const TextStyle(fontSize: 12.0)),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
