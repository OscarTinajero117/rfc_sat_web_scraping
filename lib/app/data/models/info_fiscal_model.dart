class InfoFiscal {
  final String emailUser;
  final String rfc;
  final String idCif;
  final String? curpRegimen;
  final String razonSocial;
  final String? fechaNacimientoConstitucion;
  final String? fechaInicioOperacions;
  final String? situacionContribuyente;
  final String? fechaUltimoCambio;
  final String? entidadFederativa;
  final String? municipioDelegacion;
  final String? colonia;
  final String? tipoVialidad;
  final String? nombreVialidad;
  final String? numeroExterior;
  final String? numeroInterior;
  final String cp;
  final String? correoElectronico;
  final String? al;
  final String regimen;
  final String? fechaAltaRegimen;
  final int codeRegimen;

  InfoFiscal({
    required this.emailUser,
    required this.rfc,
    required this.idCif,
    required this.curpRegimen,
    required this.razonSocial,
    required this.fechaNacimientoConstitucion,
    required this.fechaInicioOperacions,
    required this.situacionContribuyente,
    required this.fechaUltimoCambio,
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
    required this.regimen,
    required this.fechaAltaRegimen,
    required this.codeRegimen,
  });

  InfoFiscal copyWith({
    String? emailUser,
    String? rfc,
    String? idCif,
    String? curpRegimen,
    String? razonSocial,
    String? fechaNacimientoConstitucion,
    String? fechaInicioOperacions,
    String? situacionContribuyente,
    String? fechaUltimoCambio,
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
    String? regimen,
    String? fechaAltaRegimen,
    int? codeRegimen,
  }) =>
      InfoFiscal(
        emailUser: emailUser ?? this.emailUser,
        rfc: rfc ?? this.rfc,
        idCif: idCif ?? this.idCif,
        curpRegimen: curpRegimen ?? this.curpRegimen,
        razonSocial: razonSocial ?? this.razonSocial,
        fechaNacimientoConstitucion:
            fechaNacimientoConstitucion ?? this.fechaNacimientoConstitucion,
        fechaInicioOperacions:
            fechaInicioOperacions ?? this.fechaInicioOperacions,
        situacionContribuyente:
            situacionContribuyente ?? this.situacionContribuyente,
        fechaUltimoCambio: fechaUltimoCambio ?? this.fechaUltimoCambio,
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
        regimen: regimen ?? this.regimen,
        fechaAltaRegimen: fechaAltaRegimen ?? this.fechaAltaRegimen,
        codeRegimen: codeRegimen ?? this.codeRegimen,
      );

  Map<String, dynamic> get toJson => {
        "email_user": emailUser,
        "rfc": rfc,
        "id_cif": idCif,
        "curp_regimen": curpRegimen,
        "razon_social": razonSocial,
        "fecha_nacimiento_constitucion": fechaNacimientoConstitucion,
        "fecha_inicio_op": fechaInicioOperacions,
        "situacion_contribuyente": situacionContribuyente,
        "fecha_ultimo_cambio": fechaUltimoCambio,
        "entidad_federativa": entidadFederativa,
        "municipio_delegacion": municipioDelegacion,
        "colonia": colonia,
        "tipo_vialidad": tipoVialidad,
        "nombre_vialidad": nombreVialidad,
        "numero_exterior": numeroExterior,
        "numero_interior": numeroInterior,
        "codigo_postal": cp,
        "correo_electronico": correoElectronico,
        "al": al,
        "regimen": regimen,
        "fecha_alta_regimen": fechaAltaRegimen,
        "cve_regimen": codeRegimen.toString(),
      };

  factory InfoFiscal.fromJson(Map<String, dynamic> json) => InfoFiscal(
        emailUser: json["email_user"],
        rfc: json["rfc"],
        idCif: json["id_cif"],
        curpRegimen: json["curp_regimen"],
        razonSocial: json["razon_social"],
        fechaNacimientoConstitucion: json["fecha_nacimiento_constitucion"],
        fechaInicioOperacions: json["fecha_inicio_op"],
        situacionContribuyente: json["situacion_contribuyente"],
        fechaUltimoCambio: json["fecha_ultimo_cambio"],
        entidadFederativa: json["entidad_federativa"],
        municipioDelegacion: json["municipio_delegacion"],
        colonia: json["colonia"],
        tipoVialidad: json["tipo_vialidad"],
        nombreVialidad: json["nombre_vialidad"],
        numeroExterior: json["numero_exterior"],
        numeroInterior: json["numero_interior"],
        cp: json["codigo_postal"],
        correoElectronico: json["correo_electronico"],
        al: json["al"],
        regimen: json["regimen"],
        fechaAltaRegimen: json["fecha_alta_regimen"],
        codeRegimen: int.parse(json["cve_regimen"]),
      );

  factory InfoFiscal.getDefault() => InfoFiscal(
        emailUser: '',
        rfc: '',
        idCif: '',
        curpRegimen: '',
        razonSocial: '',
        fechaNacimientoConstitucion: '',
        fechaInicioOperacions: '',
        situacionContribuyente: '',
        fechaUltimoCambio: '',
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
        regimen: '',
        fechaAltaRegimen: '',
        codeRegimen: 0,
      );
}
