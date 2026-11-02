import 'package:drift/drift.dart';

import '../models/materia.dart';
import 'app_database.dart';

class MateriaLocalDataSource {
  final AppDatabase db;
  MateriaLocalDataSource(this.db);

  Materia _toDomain(MateriaRow row) => Materia(
    id: row.id,
    nombre: row.nombre,
    notaMinima: row.notaMinima,
    notaMaxima: row.notaMaxima,
    updatedAt: row.updatedAt,
    pendingSync: row.pendingSync,
  );

  Future<List<Materia>> getMaterias() async {
    final rows = await db.select(db.materias).get();
    return rows.map(_toDomain).toList();
  }

  Future<void> saveMateria(Materia materia) async {
    await db
        .into(db.materias)
        .insertOnConflictUpdate(
          MateriasCompanion.insert(
            id: Value(materia.id),
            nombre: materia.nombre,
            notaMinima: materia.notaMinima,
            notaMaxima: materia.notaMaxima,
            updatedAt: materia.updatedAt,
            pendingSync: const Value(true),
          ),
        );
  }

  Future<List<Materia>> getPendingMaterias() async {
    final rows = await (db.select(
      db.materias,
    )..where((t) => t.pendingSync.equals(true))).get();
    return rows.map(_toDomain).toList();
  }

  Future<void> markSynced(int id) async {
    await (db.update(db.materias)..where((t) => t.id.equals(id))).write(
      const MateriasCompanion(pendingSync: Value(false)),
    );
  }
}
