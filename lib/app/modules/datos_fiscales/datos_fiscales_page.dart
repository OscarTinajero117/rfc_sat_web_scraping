import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rfc_sat_web_scraping/app/global_widgets/load_splash.dart';
import 'package:rfc_sat_web_scraping/app/modules/datos_fiscales/local_widgets/info_sat.dart';

import 'datos_fiscales_controller.dart';

class DatosFiscalesPage extends GetView<DatosFiscalesController> {
  const DatosFiscalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading
        ? const LoadSplash(mensaje: 'Cargando Datos')
        : Scaffold(
            appBar: AppBar(
                title: Center(
              child:
                  Obx(() => Text('Datos Fiscales del RFC: ${controller.rfc}')),
            )),
            body: SingleChildScrollView(
              child: InfoSat(
                pfisica: controller.pFisica,
                pMoral: controller.pMoral,
                ubicacion: controller.ubicacion,
                caractFis: controller.caractFiscales,
                persona: controller.persona,
              ),
            ),
          ));
  }
}
