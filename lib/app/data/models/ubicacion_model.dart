class Ubicacion {
  Ubicacion({
    required this.entidadFederativa,
    required this.municipioDelegacion,
    required this.colonia,
    required this.tipoVialidad,
    required this.nombreVialidad,
    required this.numeroExterior,
    required this.numeroInterior,
    required this.cp,
    required this.correoElectronico,
    required this.al,
  });

  final String entidadFederativa;
  final String municipioDelegacion;
  final String colonia;
  final String tipoVialidad;
  final String nombreVialidad;
  final String numeroExterior;
  final String numeroInterior;
  final String cp;
  final String correoElectronico;
  final String al;

  Ubicacion copyWith({
    String? entidadFederativa,
    String? municipioDelegacion,
    String? colonia,
    String? tipoVialidad,
    String? nombreVialidad,
    String? numeroExterior,
    String? numeroInterior,
    String? cp,
    String? correoElectronico,
    String? al,
  }) =>
      Ubicacion(
        entidadFederativa: entidadFederativa ?? this.entidadFederativa,
        municipioDelegacion: municipioDelegacion ?? this.municipioDelegacion,
        colonia: colonia ?? this.colonia,
        tipoVialidad: tipoVialidad ?? this.tipoVialidad,
        nombreVialidad: nombreVialidad ?? this.nombreVialidad,
        numeroExterior: numeroExterior ?? this.numeroExterior,
        numeroInterior: numeroInterior ?? this.numeroInterior,
        cp: cp ?? this.cp,
        correoElectronico: correoElectronico ?? this.correoElectronico,
        al: al ?? this.al,
      );

  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        entidadFederativa: json["entidad_federativa"],
        municipioDelegacion: json["municipio_delegacion"],
        colonia: json["colonia"],
        tipoVialidad: json["tipo_vialidad"],
        nombreVialidad: json["nombre_vialidad"],
        numeroExterior: json["numero_exterior"],
        numeroInterior: json["numero_interior"],
        cp: json["cp"],
        correoElectronico: json["correo_electronico"],
        al: json["al"],
      );

  Map<String, dynamic> toJson() => {
        "entidad_federativa": entidadFederativa,
        "municipio_delegacion": municipioDelegacion,
        "colonia": colonia,
        "tipo_vialidad": tipoVialidad,
        "nombre_vialidad": nombreVialidad,
        "numero_exterior": numeroExterior,
        "numero_interior": numeroInterior,
        "cp": cp,
        "correo_electronico": correoElectronico,
        "al": al,
      };

  factory Ubicacion.getDefault() => Ubicacion(
        entidadFederativa: '',
        municipioDelegacion: '',
        colonia: '',
        tipoVialidad: '',
        nombreVialidad: '',
        numeroExterior: '',
        numeroInterior: '',
        cp: '',
        correoElectronico: '',
        al: '',
      );
}
