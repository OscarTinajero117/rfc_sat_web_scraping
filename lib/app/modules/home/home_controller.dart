// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../../core/utils/get_permissions.dart';
import '../../core/utils/get_scraping_data.dart';
import '../../data/repositories/remote/sat_scraping_repository.dart';
import '../../global_widgets/snackbar_elements.dart';
import '../../routers/app_routes.dart';

class HomeController extends GetxController {
  final SatScrapingRepository _satScrapingRepository =
      Get.find<SatScrapingRepository>();

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  void toAbout() {
    Get.toNamed(Routes.ABOUT);
  }

  Future<void> scanQR() async {
    final bool cameraPermission = await getPermission(Permission.camera);
    if (cameraPermission) {
      final String? cameraScanResult = await scanner.scan();
      _loading.value = true;
      if (cameraScanResult != null) {
        if (cameraScanResult.startsWith('https://siat.sat.gob.mx')) {
          final listSplit = cameraScanResult.split('_');
          final String rfc = listSplit[1];
          final List<List<String>> elements =
              await compute<ScrapingData, List<List<String>>>(
                  getScrapingData,
                  ScrapingData(
                    satScrapingRepository: _satScrapingRepository,
                    satUrl: cameraScanResult,
                  ));
          bool persona;
          if (rfc.length == 13) {
            //Persona física
            persona = true;
          } else {
            //Persona Moral
            persona = false;
          }
          Get.toNamed(
            Routes.DATOS_FISCALES,
            arguments: [persona, elements, rfc],
          );
          // _loading.value = false;
        } else {
          SnackBarElements().snackBarError(
            error: "Solo se permiten QR generados por el SAT",
          );
        }
      } else {
        _loading.value = false;
      }
    } else {
      SnackBarElements().snackBarWarning(
        warning: "Permiso de cámara no concedido",
      );
    }
    _loading.value = false;
  }
}
