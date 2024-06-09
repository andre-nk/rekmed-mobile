import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rekmed/app/rekmed/cubit/rekmed_cubit.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';
import 'package:rekmed/repository/rekmed/rekmed_repository.dart';
import 'package:rekmed/view/widgets/navigation/AppBar.dart';
import 'package:rekmed/view/widgets/patient/RekmedBox.dart';

class RekmedVersionPage extends StatelessWidget {
  final String rekmedID;
  const RekmedVersionPage({super.key, required this.rekmedID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: "Versi Rekam Medis",
      ),
      body: RepositoryProvider(
        create: (context) => RekmedRepository(),
        child: BlocProvider(
          create: (context) => RekmedCubit(context.read<RekmedRepository>())
            ..getRekmedVersionQuery(rekmedID),
          child: BlocBuilder<RekmedCubit, RekmedState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                queryLoaded: (rekmedQuery) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: FirestoreListView(
                      query: rekmedQuery,
                      itemBuilder: (context, snapshot) {
                        Rekmed rekmed = Rekmed.fromJson(
                          snapshot.data() as Map<String, dynamic>,
                        ).copyWith(id: snapshot.id);

                        return RekmedBox(
                          rekmed: rekmed,
                          isVersion: true,
                          overrideID: rekmedID,
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
