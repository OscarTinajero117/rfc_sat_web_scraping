import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarElements {
  SnackbarController snackBarError(
      {required String error, String titleComplement = ""}) {
    return Get.snackbar(
      "Error $titleComplement",
      error,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      onTap: (snack) => snack.isDismissible,
    );
  }

  SnackbarController snackBarWarning({
    required String warning,
    String titleComplement = "",
    Color warningColor = Colors.amber,
  }) {
    return Get.snackbar(
      "Advertencia $titleComplement",
      warning,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: warningColor,
      colorText: Colors.white,
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      onTap: (snack) => snack.isDismissible,
    );
  }

  SnackbarController snackBarNotification({
    required String notificaton,
    required String title,
    Color notificatonColor = Colors.green,
    Color textColor = Colors.white,
    IconData icon = Icons.check,
    Color iconColor = Colors.white,
  }) {
    return Get.snackbar(
      title,
      notificaton,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: notificatonColor,
      colorText: textColor,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      onTap: (snack) => snack.isDismissible,
    );
  }

  static SnackbarController unknownErrorSnackBar() {
    return Get.snackbar(
      "Error Contacte con el administrador",
      'Problema con el servidor',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      onTap: (snack) => snack.isDismissible,
    );
  }

  static SnackbarController networkErrorSnackBar() {
    return Get.snackbar(
      "Advertencia Verifique su conexión a Internet",
      'Problemas de conexión',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.amber,
      colorText: Colors.white,
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      onTap: (snack) => snack.isDismissible,
    );
  }
}
