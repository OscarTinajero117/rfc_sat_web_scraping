// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/models/caracteristicas_fiscales.dart';
import '../../data/models/p_fisica_model.dart';
import '../../data/models/p_moral_model.dart';
import '../../data/models/ubicacion_model.dart';

class DatosFiscalesController extends GetxController {
  //*Models
  Rx<PFisica> _pFisica = PFisica.getDefault().obs;
  PFisica get pFisica => _pFisica.value;

  Rx<PMoral> _pMoral = PMoral.getDefault().obs;
  PMoral get pMoral => _pMoral.value;

  Rx<Ubicacion> _ubicacion = Ubicacion.getDefault().obs;
  Ubicacion get ubicacion => _ubicacion.value;

  Rx<CaracteristicasFiscales> _caractFiscales =
      CaracteristicasFiscales.getDefault().obs;
  CaracteristicasFiscales get caractFiscales => _caractFiscales.value;

  RxBool _loading = true.obs;
  bool get loading => _loading.value;

  RxBool _persona = true.obs;
  bool get persona => _persona.value;

  RxString _rfc = ''.obs;
  String get rfc => _rfc.value;

  void _init() {
    _loading.value = true;
    _persona.value = Get.arguments[0];
    final List<List<String>> elements = Get.arguments[1];
    _rfc.value = Get.arguments[2];
    for (int i = 0; i < elements.length; i++) {
      final items = elements[i];
      for (int j = 0; j < items.length; j++) {
        _asign(i, items);
      }
    }

    _loading.value = false;
  }

  void _asign(int i, List<String> items) async {
    switch (i) {
      case 0:
        if (_persona.value) {
          _pFisica.value = PFisica(
            curp: items[0],
            nombre: items[1],
            apellidoPaterno: items[2],
            apellidoMaterno: items[3],
            fechaNacimiento: items[4],
            fechaInicioOperaciones: items[5],
            situacionContribuyente: items[6],
            fechaUltimoCambioSituacion: items[7],
          );
        } else {
          _pMoral.value = PMoral(
            razonSocial: items[0],
            regimenCapital: items[1],
            fechaConstitucion: items[2],
            fechaInicioOperaciones: items[3],
            situacionContribuyente: items[4],
            fechaUltimoCambioSituacion: items[5],
          );
        }
        break;
      case 1:
        _ubicacion.value = Ubicacion(
          entidadFederativa: items[0],
          municipioDelegacion: items[1],
          colonia: items[2],
          tipoVialidad: items[3],
          nombreVialidad: items[4],
          numeroExterior: items[5],
          numeroInterior: items[6],
          cp: items[7],
          correoElectronico: items[8],
          al: items[9],
        );
        break;
      case 2:
        final int code = await compute<String, int>(_getRegimenCode, items[0]);
        _caractFiscales.value = CaracteristicasFiscales(
          regimen: items[0],
          fechaAlta: items[1],
          codeRegimen: code,
        );
        break;
    }
  }

  void onShare() {
    if (_persona.value) {
      //física
      Share.share(''
          'RFC: \t\t ${_rfc.value}\n\n'
          'Nombre: \t\t${_pFisica.value.nombre} ${_pFisica.value.apellidoPaterno} ${_pFisica.value.apellidoMaterno}\n\n'
          'Código Postal: \t\t${_ubicacion.value.cp}\n\n'
          'Régimen Fiscal: \t\t${_caractFiscales.value.regimen}\n\n'
          'Código de Régimen: \t\t ${_caractFiscales.value.codeRegimen}\n'
          '');
    } else {
      //moral
      Share.share(''
          'RFC: \t\t ${_rfc.value}\n\n'
          'Razón Social: \t\t${_pMoral.value.razonSocial}\n\n'
          'Código Postal: \t\t${_ubicacion.value.cp}\n\n'
          'Régimen Fiscal: \t\t${_caractFiscales.value.regimen}\n\n'
          'Código de Régimen: \t\t ${_caractFiscales.value.codeRegimen}\n'
          '');
    }
  }

  static Future<int> _getRegimenCode(String regimen) async {
    if (regimen
        .toUpperCase()
        .contains('General de Ley Personas Morales'.toUpperCase())) {
      return 601;
    } else if (regimen
        .toUpperCase()
        .contains('Personas Morales con Fines no Lucrativos'.toUpperCase())) {
      return 603;
    } else if (regimen.toUpperCase().contains(
        'Sueldos y Salarios e Ingresos Asimilados a Salarios'.toUpperCase())) {
      return 605;
    } else if (regimen.toUpperCase().contains('Arrendamiento'.toUpperCase())) {
      return 606;
    } else if (regimen.toUpperCase().contains(
        'Régimen de Enajenación o Adquisición de Bienes'.toUpperCase())) {
      return 607;
    } else if (regimen.toUpperCase().contains('Demás ingresos'.toUpperCase())) {
      return 608;
    } else if (regimen.toUpperCase().contains('Consolidación'.toUpperCase())) {
      return 609;
    } else if (regimen.toUpperCase().contains(
        'Ingresos por Dividendos (socios y accionistas)'.toUpperCase())) {
      return 611;
    } else if (regimen.toUpperCase().contains(
        'Personas Físicas con Actividades Empresariales y Profesionales'
            .toUpperCase())) {
      return 612;
    } else if (regimen
        .toUpperCase()
        .contains('Ingresos por intereses'.toUpperCase())) {
      return 614;
    } else if (regimen.toUpperCase().contains(
        'Régimen de los ingresos por obtención de premios'.toUpperCase())) {
      return 615;
    } else if (regimen
        .toUpperCase()
        .contains('Sin obligaciones fiscales'.toUpperCase())) {
      return 616;
    } else if (regimen.toUpperCase().contains(
        'Sociedades Cooperativas de Producción que optan por Diferir sus Ingresos'
            .toUpperCase())) {
      return 620;
    } else if (regimen
        .toUpperCase()
        .contains('Incorporación Fiscal'.toUpperCase())) {
      return 621;
    } else if (regimen
        .toUpperCase()
        .contains('Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras'.toUpperCase())) {
      return 622;
    } else if (regimen.toUpperCase().contains('Opcional para Grupos de Sociedades'.toUpperCase())) {
      return 623;
    } else if (regimen.toUpperCase().contains('Coordinados'.toUpperCase())) {
      return 624;
    } else if (regimen.toUpperCase().contains('Hidrocarburos'.toUpperCase())) {
      return 628;
    } else if (regimen.toUpperCase().contains('De los Regímenes Fiscales Preferentes y de las Empresas Multinacionales'.toUpperCase())) {
      return 629;
    } else if (regimen.toUpperCase().contains('Enajenación de acciones en bolsa de valores'.toUpperCase())) {
      return 630;
    }
    return 0;
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
