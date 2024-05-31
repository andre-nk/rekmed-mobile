import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rekmed/model/rekmed/rekmed.dart';

class RekmedRepository {
  final FirebaseFirestore _firebaseFirestore;

  RekmedRepository() : _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Rekmed>> getRekmedByUserID(String userID, DateTime? date) async {
    try {
      QuerySnapshot<Map<String, dynamic>> rekmeds;

      if(date != null){
        rekmeds = await _firebaseFirestore
          .collection('rekmeds')
          .where('userID', isEqualTo: userID)
          .where('createdAt', isGreaterThanOrEqualTo: date)
          .where('createdAt', isLessThanOrEqualTo: date.add(const Duration(days: 1)))
          .get();
      } else {
        rekmeds = await _firebaseFirestore
          .collection('rekmeds')
          .where('userID', isEqualTo: userID)
          .get();
      }

      return rekmeds.docs.map((e) => Rekmed.fromJson(e.data())).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Rekmed> getRekmedById(String id) async {
    try {
      final rekmed = await _firebaseFirestore.collection('rekmeds').doc(id).get();
      return Rekmed.fromJson(rekmed.data()!);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addRekmed(Rekmed rekmed) async {
    try {
      await _firebaseFirestore.collection('rekmeds').add(rekmed.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateRekmed(Rekmed rekmed) async {
    try {
      Rekmed oldRekmed = await getRekmedById(rekmed.id);
      if (oldRekmed.updatedAt.isBefore(rekmed.updatedAt)) {
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
      var box = await Hive.openLazyBox('rekmed_offline');

      await box.put(rekmed.id, rekmed);
      await box.close();
    } catch (e) {
      throw Exception(e);
    }
  }
}
