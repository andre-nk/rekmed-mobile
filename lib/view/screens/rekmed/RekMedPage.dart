import 'package:rekmed/view/widgets/doctor/ProfileForm.dart';
import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';

class RekMedPage extends StatelessWidget {
  const RekMedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController birthdayController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController famController = TextEditingController();
    return Scaffold(
        appBar: const AppBarCustom(title: "Rekam Medis"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "No. RM (B/L)",
                    hintText: "Masukkan No. Rekam Medis",
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ProfileForm(
                    title: "Nama",
                    hintText: "Nama",
                    controller: birthdayController,
                    keyboardType: TextInputType.text,
                    isEditMode: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Tanggal Lahir",
                    hintText: "Masukkan tanggal lahir",
                    controller: addressController,
                    keyboardType: TextInputType.datetime,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Alamat",
                    hintText: "Masukkan alamat",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Fam Folder (B/L)",
                    hintText: "Fam Folder (B/L)",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ProfileForm(
                    title: "Tanggal Masuk",
                    hintText: "Tanggal Masuk",
                    controller: famController,
                    keyboardType: TextInputType.datetime,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Jenis Pasien",
                    hintText: "Jenis Pasien",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Unit",
                    hintText: "Unit",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "No. Jaminan",
                    hintText: "No. Jaminan",
                    controller: famController,
                    keyboardType: TextInputType.number,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Provider BPJS",
                    hintText: "Provider BPJS",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Kunjungan",
                    hintText: "Kunjungan ",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Petugas Medis",
                    hintText: "Petugas Medis",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ProfileForm(
                    title: "Tinggi Badan",
                    hintText: "Masukkan alamat",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Berat Badan",
                    hintText: "Berat Badan",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Tekanan Darah",
                    hintText: "Tekanan Darah",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Suhu Tubuh",
                    hintText: "Suhu Tubuh",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                const SizedBox(height: 35.0),
                const Center(
                  child: Text(
                    "Diagnosis",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0),
                  child: ProfileForm(
                    title: "Diagnosis 1",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Kode Diagnosis",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "B/L/KK",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ProfileForm(
                    title: "Diagnosis 2",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Kode Diagnosis",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "B/L/KK",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                const SizedBox(height: 35.0),
                const Center(
                  child: Text(
                    "Obat",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0),
                  child: ProfileForm(
                    title: "Obat 1",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Kode Obat",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Dosis",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Jumlah",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Alergi",
                    hintText: "xxxxx",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Tindak Lanjut",
                    hintText: "-",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ProfileForm(
                    title: "Petugas",
                    hintText: "-",
                    controller: famController,
                    keyboardType: TextInputType.text,
                    isEditMode: true,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
