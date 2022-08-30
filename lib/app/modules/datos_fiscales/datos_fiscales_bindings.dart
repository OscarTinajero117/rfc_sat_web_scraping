import 'package:get/get.dart';

import 'datos_fiscales_controller.dart';

class DatosFiscalesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatosFiscalesController>(() => DatosFiscalesController());
  }
}
