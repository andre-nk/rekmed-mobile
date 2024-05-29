import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/doctor/ProfileForm.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';
import 'package:rekmed/view/widgets/patient/RekMedBox.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController= TextEditingController();
    final TextEditingController birthdayController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController famController = TextEditingController();
    return Scaffold(
      appBar: const AppBarCustom(title: "Data Pasien"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Nama",
                  hintText: "Masukkan nama",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Tanggal Lahir",
                  hintText: "Masukkan tanggal lahir",
                  controller: birthdayController,
                  keyboardType: TextInputType.datetime,
                  isEditMode: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Alamat",
                  hintText: "Masukkan alamat",
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Keluarga Terdekat",
                  hintText: "Masukkan nama keluarga terdekat",
                  controller: famController,
                  keyboardType: TextInputType.text,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rekam Medis",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        // Aksi yang dijalankan saat tombol edit ditekan
                        // Misalnya, mengubah mode edit
                      },
                    ),
                  ],
                )
              ),
              Container(
                child: Rekmedbox(
                  idRekamMedis: "123456",
                  namaPasien: "Sandra Dewi",
                  dokter: "dr. Andreas",
                  tanggal: DateTime.now(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}