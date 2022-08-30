class CaracteristicasFiscales {
  CaracteristicasFiscales({
    required this.regimen,
    required this.fechaAlta,
    required this.codeRegimen,
  });

  final String regimen;
  final String fechaAlta;
  final int codeRegimen;

  CaracteristicasFiscales copyWith({
    String? regimen,
    String? fechaAlta,
    int? codeRegimen,
  }) =>
      CaracteristicasFiscales(
        regimen: regimen ?? this.regimen,
        fechaAlta: fechaAlta ?? this.fechaAlta,
        codeRegimen: codeRegimen ?? this.codeRegimen,
      );

  factory CaracteristicasFiscales.fromJson(Map<String, dynamic> json) =>
      CaracteristicasFiscales(
          regimen: json["regimen"],
          fechaAlta: json["fecha_alta"],
          codeRegimen: json["code_regimen"]);

  Map<String, dynamic> toJson() => {
        "regimen": regimen,
        "fecha_alta": fechaAlta,
        "code_regimen": codeRegimen,
      };

  factory CaracteristicasFiscales.getDefault() => CaracteristicasFiscales(
        regimen: '',
        fechaAlta: '',
        codeRegimen: 0,
      );
}
