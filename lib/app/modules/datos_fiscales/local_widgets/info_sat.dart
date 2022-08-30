import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/caracteristicas_fiscales.dart';
import '../../../data/models/p_fisica_model.dart';
import '../../../data/models/p_moral_model.dart';
import '../../../data/models/ubicacion_model.dart';
import 'table_info_sat.dart';

class InfoSat extends StatelessWidget {
  final PFisica pfisica;
  final PMoral pMoral;
  final Ubicacion ubicacion;
  final bool persona;
  final CaracteristicasFiscales caractFis;
  const InfoSat({
    super.key,
    required this.pfisica,
    required this.pMoral,
    required this.ubicacion,
    required this.caractFis,
    required this.persona,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        persona
            ? //persona física
            TableInfoSat(
                tableTitle: 'Datos de Identificación',
                children: [
                  tableRowInformation(
                    title: "CURP:",
                    information: pfisica.curp,
                  ),
                  tableRowInformation(
                    title: "Nombre:",
                    information: pfisica.nombre,
                  ),
                  tableRowInformation(
                    title: "Apellido Paterno:",
                    information: pfisica.apellidoPaterno,
                  ),
                  tableRowInformation(
                    title: "Apellido Materno:",
                    information: pfisica.apellidoMaterno,
                  ),
                  tableRowInformation(
                    title: "Fecha Nacimiento:",
                    information: pfisica.fechaNacimiento,
                  ),
                  tableRowInformation(
                    title: "Fecha de Inicio de operaciones:",
                    information: pfisica.fechaInicioOperaciones,
                  ),
                  tableRowInformation(
                    title: "Situación del contribuyente:",
                    information: pfisica.situacionContribuyente,
                  ),
                  tableRowInformation(
                    title: "Fecha del último cambio de situación:",
                    information: pfisica.fechaUltimoCambioSituacion,
                  ),
                ],
              )
            : //persona moral
            TableInfoSat(
                tableTitle: 'Datos de Identificación',
                children: [
                  tableRowInformation(
                    title: "Denominación o Razón Social:",
                    information: pMoral.razonSocial,
                  ),
                  tableRowInformation(
                    title: "Régimen de capital:",
                    information: pMoral.regimenCapital,
                  ),
                  tableRowInformation(
                    title: "Fecha de constitución:",
                    information: pMoral.fechaConstitucion,
                  ),
                  tableRowInformation(
                    title: "Fecha de Inicio de operaciones:",
                    information: pMoral.fechaInicioOperaciones,
                  ),
                  tableRowInformation(
                    title: "Situación del contribuyente:",
                    information: pMoral.situacionContribuyente,
                  ),
                  tableRowInformation(
                    title: "Fecha del último cambio de situación:",
                    information: pMoral.fechaUltimoCambioSituacion,
                  ),
                ],
              ),
        const SizedBox(height: 10.0),
        //ubicacion
        TableInfoSat(
          tableTitle: 'Datos de Ubicación (domicilio fiscal, vigente)',
          children: [
            tableRowInformation(
              title: "Entidad Federativa:",
              information: ubicacion.entidadFederativa,
            ),
            tableRowInformation(
              title: "Municipio o delegación:",
              information: ubicacion.municipioDelegacion,
            ),
            tableRowInformation(
              title: "Colonia:",
              information: ubicacion.colonia,
            ),
            tableRowInformation(
              title: "Tipo de vialidad:",
              information: ubicacion.tipoVialidad,
            ),
            tableRowInformation(
              title: "Nombre de la vialidad:",
              information: ubicacion.nombreVialidad,
            ),
            tableRowInformation(
              title: "Número exterior:",
              information: ubicacion.numeroExterior,
            ),
            tableRowInformation(
              title: "Número interior:",
              information: ubicacion.numeroInterior,
            ),
            tableRowInformation(
              title: "Código Postal:",
              information: ubicacion.cp,
            ),
            tableRowInformation(
              title: "Correo electrónico:",
              information: ubicacion.correoElectronico,
            ),
            tableRowInformation(
              title: "AL:",
              information: ubicacion.al,
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        //Caracteristicas
        TableInfoSat(
          tableTitle: 'Características fiscales (vigente)',
          children: [
            tableRowInformation(
              title: "Régimen:",
              information: caractFis.regimen,
            ),
            tableRowInformation(
              title: "Código del Régimen:",
              information: caractFis.codeRegimen.toString(),
            ),
            tableRowInformation(
              title: "Fecha de alta:",
              information: caractFis.fechaAlta,
            ),
          ],
        ),
      ],
    );
  }

  TableRow tableRowInformation(
      {required String title, required String information}) {
    return TableRow(
      children: [
        containerTextInformation(
          text: title,
          fontWeight: FontWeight.bold,
        ),
        containerTextInformation(
          text: information,
        ),
      ],
    );
  }

  Container containerTextInformation(
      {required String text, FontWeight fontWeight = FontWeight.normal}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Get.width < 360
              ? 13
              : Get.width < 720
                  ? 16
                  : 20,
          fontWeight: fontWeight,
          color: Colors.black,
        ),
      ),
    );
  }
}
