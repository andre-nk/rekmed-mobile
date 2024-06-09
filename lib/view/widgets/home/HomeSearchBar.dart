import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/doctor/cubit/doctor_cubit.dart';
import 'package:rekmed/app/patient/cubit/patient_cubit.dart';

class HomeSearchBar extends StatefulWidget {
  final String clinicID;
  final bool isPatientSearch;
  const HomeSearchBar({super.key, required this.clinicID, required this.isPatientSearch});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      onFieldSubmitted: (value) {
        if (widget.isPatientSearch) {
          context.read<PatientCubit>().loadSearchQuery(widget.clinicID, value);
        } else {
          context.read<DoctorCubit>().loadSearchQuery(widget.clinicID, value);
        }
      },
      decoration: const InputDecoration(
        labelText: 'Cari dokter...',
        filled: false,
        suffixIcon: Icon(Icons.search),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
