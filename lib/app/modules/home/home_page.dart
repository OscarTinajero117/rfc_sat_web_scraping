import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/load_splash.dart';
import '../../global_widgets/rounded_button.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading
        ? const LoadSplash(mensaje: 'Cargando')
        : Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'RFC por QR',
                  textAlign: TextAlign.center,
                ),
              ),
              leading: const SizedBox(width: 5.0),
              actions: [
                IconButton(
                  onPressed: controller.toAbout,
                  icon: const Icon(Icons.info),
                ),
                const SizedBox(width: 5.0),
              ],
            ),
            body: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Escanea el código QR\nque viene en la constancia\nde situación fiscal',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    RoundedButton(
                      text: 'Escanear QR',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        controller.scanQR();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ));
  }
}
