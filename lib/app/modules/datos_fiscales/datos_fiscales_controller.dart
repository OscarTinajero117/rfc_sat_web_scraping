// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:rfc_sat_web_scraping/app/data/models/caracteristicas_fiscales.dart';
import 'package:rfc_sat_web_scraping/app/data/models/p_fisica_model.dart';
import 'package:rfc_sat_web_scraping/app/data/models/p_moral_model.dart';
import 'package:rfc_sat_web_scraping/app/data/models/ubicacion_model.dart';

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

  void _asign(int i, List<String> items) {
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
        _caractFiscales.value = CaracteristicasFiscales(
          regimen: items[0],
          fechaAlta: items[1],
        );
        break;
    }
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
