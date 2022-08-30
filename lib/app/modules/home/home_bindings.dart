import 'package:get/get.dart';

import '../../data/providers/remote/sat_scraping_provider.dart';
import '../../data/repositories/remote/sat_scraping_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SatScrapingRepository>(() => SatScrapingRepository());
    Get.lazyPut<SatScrapingProvider>(() => SatScrapingProvider());
  }
}
