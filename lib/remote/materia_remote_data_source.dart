import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/materia.dart';

class MateriaRemoteDataSource {
  final FirebaseFirestore firestore;
  MateriaRemoteDataSource(this.firestore);

  Future<void> upsertMateria(Materia materia) async {
    await firestore
        .collection('materias')
        .doc(materia.id.toString())
        .set(materia.toJson());
  }
}
