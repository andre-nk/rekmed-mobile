import 'package:flutter/material.dart';
import 'package:rekmed/view/widgets/doctor/ProfileForm.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';
import 'package:rekmed/view/widgets/doctor/DoctorProfilePicture.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController nikController = TextEditingController();
    final TextEditingController strController = TextEditingController();
    final TextEditingController poliController = TextEditingController();
    final TextEditingController kodeController = TextEditingController();

    return Scaffold(
      appBar: const AppBarCustom(title: "Data Dokter"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DoctorProfilePicture(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Username",
                  hintText: "Masukkan username",
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "E-mail",
                  hintText: "Masukkan e-mail",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  isEditMode: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "No. Telepon",
                  hintText: "Masukkan no. telepon",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Nama Dokter",
                  hintText: "Masukkan nama dokter",
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "NIK",
                  hintText: "Masukkan NIK",
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "No. STR",
                  hintText: "Masukkan no. STR",
                  controller: strController,
                  keyboardType: TextInputType.number,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Poli",
                  hintText: "Masukkan poli",
                  controller: poliController,
                  keyboardType: TextInputType.text,
                  isEditMode: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ProfileForm(
                  title: "Kode Dokter",
                  hintText: "Masukkan kode dokter",
                  controller: kodeController,
                  keyboardType: TextInputType.text,
                  isEditMode: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
