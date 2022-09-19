import 'package:get/get.dart';

import '../../modules/home/home_controller.dart';

class DependencyInjection {
  static void init() {
    // ///Providers
    // Get.lazyPut<DireccionesProvider>(
    //   () => DireccionesProvider(),
    //   fenix: true,
    // );

    // ///Repositories
    // Get.lazyPut<DireccionesRepository>(
    //   () => DireccionesRepository(),
    //   fenix: true,
    // );

    ///Controllers
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
  }
}
