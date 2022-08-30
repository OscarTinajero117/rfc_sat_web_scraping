import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/load_splash.dart';
import 'datos_fiscales_controller.dart';
import 'local_widgets/info_sat.dart';

class DatosFiscalesPage extends GetView<DatosFiscalesController> {
  const DatosFiscalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading
        ? const LoadSplash(mensaje: 'Cargando Datos')
        : Scaffold(
            appBar: AppBar(
              title: Center(
                child: Obx(
                    () => Text('Datos Fiscales del RFC: ${controller.rfc}')),
              ),
              actions: [
                IconButton(
                  onPressed: controller.onShare,
                  icon: const Icon(Icons.share),
                )
              ],
            ),
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
