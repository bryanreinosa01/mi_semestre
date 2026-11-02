class Materia {
  final int id;
  final String nombre;
  final double notaMinima;
  final double notaMaxima;
  final DateTime updatedAt;
  final bool pendingSync;

  const Materia({
    required this.id,
    required this.nombre,
    required this.notaMinima,
    required this.notaMaxima,
    required this.updatedAt,
    this.pendingSync = true,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'notaMinima': notaMinima,
    'notaMaxima': notaMaxima,
    'updatedAt': updatedAt.toIso8601String(),
  };
}
