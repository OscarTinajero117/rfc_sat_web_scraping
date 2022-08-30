import 'package:consulta_rfc/app/global_widgets/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_controller.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final year = controller.getYear();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Acerca de...',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/arquos.png',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  rootAsset: 'assets/icons/fb_icon_325x325.png',
                  onTap: () {
                    controller.toUrl('https://www.facebook.com/nerus.mexico');
                  },
                ),
                SocialIcon(
                  rootAsset: 'assets/icons/arquos_i.png',
                  onTap: () {
                    controller
                        .toUrl('https://nerus.com.mx/Soluciones/Nerus.html');
                  },
                ),
                SocialIcon(
                  rootAsset: 'assets/icons/twitter_logo.png',
                  onTap: () {
                    controller.toUrl('https://twitter.com/NerusMX');
                  },
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              "Soporte:",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            Text(
              "nerus.web@nerus.com.mx",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            Text(
              "834 314 6242",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            Text(
              "Soluciones Nerus SA de CV",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            Text(
              "Ciudad Victoria, Tamaulipas, MX",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            Text(
              "Marca Registrada y Derechos Reservados",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            Text(
              "2013 - $year",
              style: TextStyle(
                  fontSize: Get.width < 360
                      ? 14
                      : Get.width < 720
                          ? 16
                          : 18),
            ),
            const SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
