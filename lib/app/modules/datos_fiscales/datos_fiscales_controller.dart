// ignore_for_file: prefer_final_fields, invalid_use_of_protected_member, avoid_print

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

  RxList<CaracteristicasFiscales> _listCaractFiscales =
      <CaracteristicasFiscales>[].obs;
  List<CaracteristicasFiscales> get listCaractFiscales =>
      _listCaractFiscales.value;

  int _globalIndex = 0;

  RxBool _loading = true.obs;
  bool get loading => _loading.value;

  RxBool _persona = true.obs;
  bool get persona => _persona.value;

  RxString _rfc = ''.obs;
  String get rfc => _rfc.value;

  RxString _idCif = ''.obs;
  String get idCif => _idCif.value;

  void _init() async {
    _globalIndex = 0;
    _loading.value = true;
    _persona.value = Get.arguments[0];
    final List<List<String>> elements = Get.arguments[1];
    _rfc.value = Get.arguments[2];
    _idCif.value = Get.arguments[3];
    for (int i = 0; i < elements.length; i++) {
      final items = elements[i];
      for (int j = 0; j < items.length; j++) {
        await _asign(i, items);
      }
    }

    _loading.value = false;
  }

  Future<void> _asign(int index, List<String> items) async {
    switch (index) {
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
        while (_globalIndex < items.length) {
          final int code = await _getRegimenCode(items[_globalIndex]);
          _listCaractFiscales.add(CaracteristicasFiscales(
            regimen: items[_globalIndex],
            fechaAlta: items[_globalIndex + 1],
            codeRegimen: code,
          ));
          _globalIndex += 2;
        }
        break;
    }
  }

  void onShare() {
    String regimenesComplete = '';
    for (CaracteristicasFiscales row in listCaractFiscales) {
      regimenesComplete +=
          'Régimen Fiscal: \t\t${row.codeRegimen} - ${row.regimen}\n\n';
    }
    if (_persona.value) {
      //física
      Share.share(''
          'RFC: \t\t ${_rfc.value}\n\n'
          'ID CIF: \t\t ${_idCif.value}\n\n'
          'Nombre: \t\t${_pFisica.value.nombre} ${_pFisica.value.apellidoPaterno} ${_pFisica.value.apellidoMaterno}\n\n'
          'Código Postal: \t\t${_ubicacion.value.cp}\n\n'
          '$regimenesComplete'
          '');
    } else {
      //moral
      Share.share(''
          'RFC: \t\t ${_rfc.value}\n\n'
          'ID CIF: \t\t ${_idCif.value}\n\n'
          'Razón Social: \t\t${_pMoral.value.razonSocial}\n\n'
          'Código Postal: \t\t${_ubicacion.value.cp}\n\n'
          '$regimenesComplete'
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
        'Residentes en el Extranjero sin Establecimiento Permanente en México'
            .toUpperCase())) {
      return 610;
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
        'Sociedades Cooperativas de Producción que optan por Diferir sus Ingresos'.toUpperCase())) {
      return 620;
    } else if (regimen.toUpperCase().contains('Incorporación Fiscal'.toUpperCase())) {
      return 621;
    } else if (regimen.toUpperCase().contains('Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras'.toUpperCase())) {
      return 622;
    } else if (regimen.toUpperCase().contains('Opcional para Grupos de Sociedades'.toUpperCase())) {
      return 623;
    } else if (regimen.toUpperCase().contains('Coordinados'.toUpperCase())) {
      return 624;
    } else if (regimen.toUpperCase().contains('Régimen de las Actividades Empresariales con ingresos a través de Plataformas Tecnológicas'.toUpperCase())) {
      return 625;
    } else if (regimen.toUpperCase().contains('Régimen Simplificado de Confianza'.toUpperCase())) {
      return 626;
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
