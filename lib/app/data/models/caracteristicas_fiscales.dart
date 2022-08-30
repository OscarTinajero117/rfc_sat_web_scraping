class CaracteristicasFiscales {
  CaracteristicasFiscales({
    required this.regimen,
    required this.fechaAlta,
  });

  final String regimen;
  final String fechaAlta;

  CaracteristicasFiscales copyWith({
    String? regimen,
    String? fechaAlta,
  }) =>
      CaracteristicasFiscales(
        regimen: regimen ?? this.regimen,
        fechaAlta: fechaAlta ?? this.fechaAlta,
      );

  factory CaracteristicasFiscales.fromJson(Map<String, dynamic> json) =>
      CaracteristicasFiscales(
        regimen: json["regimen"],
        fechaAlta: json["fecha_alta"],
      );

  Map<String, dynamic> toJson() => {
        "regimen": regimen,
        "fecha_alta": fechaAlta,
      };

  factory CaracteristicasFiscales.getDefault() => CaracteristicasFiscales(
        regimen: '',
        fechaAlta: '',
      );
}
