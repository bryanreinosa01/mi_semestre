import '../local/materia_local_data_source.dart';
import '../models/materia.dart';
import '../remote/materia_remote_data_source.dart';

class MateriaRepository {
  final MateriaLocalDataSource local;
  final MateriaRemoteDataSource? remote;
  MateriaRepository({required this.local, this.remote});

  Future<List<Materia>> getMaterias() => local.getMaterias();

  Future<void> saveMateria(Materia materia) async {
    await local.saveMateria(materia);
    final remoteSource = remote;
    if (remoteSource == null) return;
    try {
      await remoteSource.upsertMateria(materia);
      await local.markSynced(materia.id);
    } catch (_) {
      // El guardado local ya termino; el cambio permanece pendiente.
    }
  }

  Future<void> syncPending() async {
    final remoteSource = remote;
    if (remoteSource == null) return;
    final pending = await local.getPendingMaterias();
    for (final materia in pending) {
      try {
        await remoteSource.upsertMateria(materia);
        await local.markSynced(materia.id);
      } catch (_) {
        // Se conserva pendiente para el siguiente intento.
      }
    }
  }
}
