class PMoral {
  PMoral({
    required this.razonSocial,
    required this.regimenCapital,
    required this.fechaConstitucion,
    required this.fechaInicioOperaciones,
    required this.situacionContribuyente,
    required this.fechaUltimoCambioSituacion,
  });

  final String razonSocial;
  final String regimenCapital;
  final String fechaConstitucion;
  final String fechaInicioOperaciones;
  final String situacionContribuyente;
  final String fechaUltimoCambioSituacion;

  PMoral copyWith({
    String? razonSocial,
    String? regimenCapital,
    String? fechaConstitucion,
    String? fechaInicioOperaciones,
    String? situacionContribuyente,
    String? fechaUltimoCambioSituacion,
  }) =>
      PMoral(
        razonSocial: razonSocial ?? this.razonSocial,
        regimenCapital: regimenCapital ?? this.regimenCapital,
        fechaConstitucion: fechaConstitucion ?? this.fechaConstitucion,
        fechaInicioOperaciones:
            fechaInicioOperaciones ?? this.fechaInicioOperaciones,
        situacionContribuyente:
            situacionContribuyente ?? this.situacionContribuyente,
        fechaUltimoCambioSituacion:
            fechaUltimoCambioSituacion ?? this.fechaUltimoCambioSituacion,
      );

  factory PMoral.fromJson(Map<String, dynamic> json) => PMoral(
        razonSocial: json["razon_social"],
        regimenCapital: json["regimen_capital"],
        fechaConstitucion: json["fecha_constitucion"],
        fechaInicioOperaciones: json["fecha_inicio_operaciones"],
        situacionContribuyente: json["situacion_contribuyente"],
        fechaUltimoCambioSituacion: json["fecha_ultimo_cambio_situacion"],
      );

  Map<String, dynamic> toJson() => {
        "razon_social": razonSocial,
        "regimen_capital": regimenCapital,
        "fecha_constitucion": fechaConstitucion,
        "fecha_inicio_operaciones": fechaInicioOperaciones,
        "situacion_contribuyente": situacionContribuyente,
        "fecha_ultimo_cambio_situacion": fechaUltimoCambioSituacion,
      };

  factory PMoral.getDefault() => PMoral(
        razonSocial: '',
        regimenCapital: '',
        fechaConstitucion: '',
        fechaInicioOperaciones: '',
        situacionContribuyente: '',
        fechaUltimoCambioSituacion: '',
      );
}
