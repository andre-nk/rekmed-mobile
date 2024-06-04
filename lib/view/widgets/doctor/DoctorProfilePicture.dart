import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/doctor/cubit/doctor_cubit.dart';

class DoctorProfilePicture extends StatefulWidget {
  final String doctorID;
  final String? profilePicture;
  final bool isEditing;
  const DoctorProfilePicture(
      {super.key, required this.doctorID, required this.isEditing, this.profilePicture});

  @override
  State<DoctorProfilePicture> createState() => _DoctorProfilePictureState();
}

class _DoctorProfilePictureState extends State<DoctorProfilePicture> {
  File _imageFile = File('');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          profilePictureUploaded: (val) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Foto profil berhasil diupload!'),
                backgroundColor: Colors.green,
              ),
            );
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 175,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  image: _imageFile.path.isNotEmpty
                      ? DecorationImage(
                          image: FileImage(_imageFile),
                          fit: BoxFit.cover,
                        )
                      : widget.profilePicture != null
                          ? DecorationImage(
                              image: NetworkImage(widget.profilePicture!),
                              fit: BoxFit.cover,
                            )
                          : null,
                ),
                child: _imageFile.path.isEmpty && widget.profilePicture == null
                    ? const Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.black,
                      )
                    : null,
              ),
              widget.isEditing
                  ? ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                        );

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          setState(() {
                            _imageFile = file;
                          });

                          // ignore: use_build_context_synchronously
                          context
                              .read<DoctorCubit>()
                              .uploadDoctorProfilePicture(_imageFile, widget.doctorID);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Ganti Foto Profil',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
