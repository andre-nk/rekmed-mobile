import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/rekmed/cubit/rekmed_cubit.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';

class HomeBox extends StatelessWidget {
  final String clinicID;
  const HomeBox({super.key, required this.clinicID});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RekmedRepository(),
      child: BlocProvider(
        create: (context) => RekmedCubit(context.read<RekmedRepository>())
          ..getRekmedCountByClinic(clinicID),
        child: Container(
          padding: const EdgeInsets.all(28.0),
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF04AE91), Color(0xFF05CAD5)],
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Jumlah pasien",
                style: TextStyle(
                    fontSize: 18.0,
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              BlocBuilder<RekmedCubit, RekmedState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    countLoaded: (count) {
                      return Text(
                        count.toString(),
                        style: const TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    orElse: () {
                      return const CircularProgressIndicator();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
