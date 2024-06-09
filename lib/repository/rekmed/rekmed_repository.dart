import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';

class RekmedRepository {
  final FirebaseFirestore _firebaseFirestore;

  RekmedRepository() : _firebaseFirestore = FirebaseFirestore.instance;

  Future<int> getRekmedCountByClinicID(String clinicID, DateTime date) async {
    try {
      QuerySnapshot<Map<String, dynamic>> rekmeds;
      rekmeds = await _firebaseFirestore
          .collection('rekmeds')
          .where('clinicID', isEqualTo: clinicID)
          .get();

      return rekmeds.docs.length;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Rekmed> getRekmedById(String id, bool isOffline) async {
    try {
      var box = await Hive.openBox('rekmed_offline');
      dynamic boxObject = box.get(id);

      if (isOffline && boxObject != null) {
        Rekmed rekmed = boxObject as Rekmed;
        await box.close();
        return rekmed;
      } else {
        DocumentSnapshot<Map<String, dynamic>> rekmed;
        rekmed = await _firebaseFirestore.collection('rekmeds').doc(id).get();

        return Rekmed.fromJson(rekmed.data()!);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addRekmed(Rekmed rekmed) async {
    try {
      await _firebaseFirestore.collection('rekmeds').doc(rekmed.id).set(
            rekmed.toJson(),
          );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateRekmed(Rekmed rekmed, bool isOffline) async {
    try {
      if (isOffline) {
        await updateRekmedOffline(rekmed);
      } else {
        Rekmed oldRekmed = await getRekmedById(rekmed.id!, false);
        if (oldRekmed.updatedAt.isBefore(rekmed.updatedAt) ||
            oldRekmed.updatedAt == rekmed.updatedAt) {
          await _firebaseFirestore.collection('rekmeds').doc(rekmed.id).update(
                rekmed.toJson(),
              );
        } else {
          await _firebaseFirestore
              .collection('rekmeds')
              .doc(rekmed.id)
              .collection('versions')
              .add(rekmed.toJson());
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> overrideUpdateRekmed(Rekmed rekmed, String overrideID) async {
    try {
      await _firebaseFirestore.collection('rekmeds').doc(overrideID).update(
            rekmed.toJson(),
          );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteRekmed(String id) async {
    try {
      await _firebaseFirestore.collection('rekmeds').doc(id).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateRekmedOffline(Rekmed rekmed) async {
    try {
      var box = await Hive.openBox('rekmed_offline');
      await box.put(rekmed.id, rekmed);
      await box.close();

    } catch (e) {
      throw Exception(e);
    }
  }
}
