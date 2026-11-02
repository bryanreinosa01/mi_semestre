import 'package:drift/drift.dart';

@DataClassName('MateriaRow')
class Materias extends Table {
  IntColumn get id => integer()();
  TextColumn get nombre => text()();
  RealColumn get notaMinima => real()();
  RealColumn get notaMaxima => real()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get pendingSync => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {id};
}
