class PFisica {
  PFisica({
    required this.curp,
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.fechaNacimiento,
    required this.fechaInicioOperaciones,
    required this.situacionContribuyente,
    required this.fechaUltimoCambioSituacion,
  });

  final String curp;
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String fechaNacimiento;
  final String fechaInicioOperaciones;
  final String situacionContribuyente;
  final String fechaUltimoCambioSituacion;

  PFisica copyWith({
    String? curp,
    String? nombre,
    String? apellidoPaterno,
    String? apellidoMaterno,
    String? fechaNacimiento,
    String? fechaInicioOperaciones,
    String? situacionContribuyente,
    String? fechaUltimoCambioSituacion,
  }) =>
      PFisica(
        curp: curp ?? this.curp,
        nombre: nombre ?? this.nombre,
        apellidoPaterno: apellidoPaterno ?? this.apellidoPaterno,
        apellidoMaterno: apellidoMaterno ?? this.apellidoMaterno,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        fechaInicioOperaciones:
            fechaInicioOperaciones ?? this.fechaInicioOperaciones,
        situacionContribuyente:
            situacionContribuyente ?? this.situacionContribuyente,
        fechaUltimoCambioSituacion:
            fechaUltimoCambioSituacion ?? this.fechaUltimoCambioSituacion,
      );

  factory PFisica.fromJson(Map<String, dynamic> json) => PFisica(
        curp: json["curp"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellido_paterno"],
        apellidoMaterno: json["apellido_materno"],
        fechaNacimiento: json["fecha_nacimiento"],
        fechaInicioOperaciones: json["fecha_inicio_operaciones"],
        situacionContribuyente: json["situacion_contribuyente"],
        fechaUltimoCambioSituacion: json["fecha_ultimo_cambio_situacion"],
      );

  Map<String, dynamic> toJson() => {
        "curp": curp,
        "nombre": nombre,
        "apellido_paterno": apellidoPaterno,
        "apellido_materno": apellidoMaterno,
        "fecha_nacimiento": fechaNacimiento,
        "fecha_inicio_operaciones": fechaInicioOperaciones,
        "situacion_contribuyente": situacionContribuyente,
        "fecha_ultimo_cambio_situacion": fechaUltimoCambioSituacion,
      };

  factory PFisica.getDefault() => PFisica(
        curp: '',
        nombre: '',
        apellidoPaterno: '',
        apellidoMaterno: '',
        fechaNacimiento: '',
        fechaInicioOperaciones: '',
        situacionContribuyente: '',
        fechaUltimoCambioSituacion: '',
      );
}
