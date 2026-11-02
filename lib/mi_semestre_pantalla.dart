import 'package:flutter/material.dart';

import 'models/materia.dart';
import 'repositories/materia_repository.dart';

class MiSemestrePantalla extends StatefulWidget {
  final MateriaRepository repository;
  const MiSemestrePantalla({super.key, required this.repository});

  @override
  State<MiSemestrePantalla> createState() => _MiSemestrePantallaState();
}

class _MiSemestrePantallaState extends State<MiSemestrePantalla> {
  List<Materia> _materias = [];
  bool _cargando = true;
  bool _ocupado = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    try {
      final materias = await widget.repository.getMaterias();
      if (!mounted) return;
      setState(() {
        _materias = materias;
        _cargando = false;
        _error = '';
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _cargando = false;
        _error = 'No se pudieron cargar las materias.';
      });
    }
  }

  void _mensaje(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  Future<void> _sincronizar() async {
    setState(() => _ocupado = true);
    try {
      await widget.repository.syncPending();
      await _cargar();
    } catch (_) {
      if (mounted) _mensaje('No se pudo sincronizar. Intenta nuevamente.');
    }
    if (mounted) setState(() => _ocupado = false);
  }

  Future<void> _formulario([Materia? materia]) async {
    String nombreMateria = '';
    String notaMinima = '';
    String notaMaxima = '5.0';
    if (materia != null) {
      nombreMateria = materia.nombre;
      notaMinima = materia.notaMinima.toString();
      notaMaxima = materia.notaMaxima.toString();
    }

    // El dialogo devuelve los datos; el repositorio se encarga de guardarlos.
    final nueva = await showDialog<Materia>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(materia == null ? 'Agregar materia' : 'Editar materia'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: nombreMateria,
                onChanged: (valor) => nombreMateria = valor,
                decoration: const InputDecoration(
                  labelText: 'Nombre de la materia',
                  hintText: 'Ejemplo: Fisica II',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: notaMinima,
                onChanged: (valor) => notaMinima = valor,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nota minima para aprobar',
                  hintText: 'Ejemplo: 3.0',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: notaMaxima,
                onChanged: (valor) => notaMaxima = valor,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nota maxima',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final nombre = nombreMateria.trim();
              final minima = double.tryParse(notaMinima.replaceAll(',', '.'));
              final maxima = double.tryParse(notaMaxima.replaceAll(',', '.'));
              if (nombre.isEmpty ||
                  minima == null ||
                  maxima == null ||
                  !minima.isFinite ||
                  !maxima.isFinite ||
                  minima <= 0 ||
                  maxima <= 0 ||
                  minima > maxima) {
                _mensaje(
                  'Ingresa un nombre y notas validas. '
                  'La minima debe ser mayor que 0 y no superar la maxima.',
                );
                return;
              }
              final ahora = DateTime.now();
              // Una materia nueva necesita ID; al editar conservamos el mismo.
              int id = ahora.microsecondsSinceEpoch;
              if (materia != null) id = materia.id;
              final datos = Materia(
                id: id,
                nombre: nombre,
                notaMinima: minima,
                notaMaxima: maxima,
                updatedAt: ahora,
              );
              Navigator.pop(dialogContext, datos);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );

    if (nueva == null || !mounted) return;
    setState(() => _ocupado = true);
    try {
      await widget.repository.saveMateria(nueva);
      if (!mounted) return;
      _mensaje('Materia guardada en este dispositivo.');
    } catch (_) {
      if (mounted) _mensaje('No se pudo guardar. Intenta nuevamente.');
    }
    // Leer siempre desde Drift, como indica la guia.
    await _cargar();
    if (mounted) setState(() => _ocupado = false);
  }

  Widget _mostrarMaterias() {
    if (_cargando) return const Text('Cargando materias...');
    if (_error.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_error),
          TextButton(onPressed: _cargar, child: const Text('Reintentar')),
        ],
      );
    }
    if (_materias.isEmpty) {
      return const Text('Todavia no has agregado materias');
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _materias.length,
      itemBuilder: (context, index) {
        final materia = _materias[index];
        return ListTile(
          title: Text(materia.nombre),
          subtitle: Text(
            'Minima: ${materia.notaMinima} | Maxima: ${materia.notaMaxima}\n'
            '${materia.pendingSync ? 'Pendiente de sincronizacion' : 'Sincronizada'}',
          ),
          isThreeLine: true,
          trailing: IconButton(
            tooltip: 'Editar ${materia.nombre}',
            icon: const Icon(Icons.edit_outlined),
            onPressed: _ocupado ? null : () => _formulario(materia),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Mi Semestre', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          Flexible(child: _mostrarMaterias()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _cargando || _ocupado ? null : () => _formulario(),
            child: const Text('Agregar materia'),
          ),
          IconButton(
            tooltip: 'Sincronizar materias',
            icon: const Icon(Icons.sync),
            onPressed: _ocupado || _cargando ? null : _sincronizar,
          ),
        ],
      ),
    );
  }
}
