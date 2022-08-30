import 'package:get/get.dart';

import '../../providers/remote/sat_scraping_provider.dart';

class SatScrapingRepository {
  final SatScrapingProvider _satScrapingProvider =
      Get.find<SatScrapingProvider>();

  Future<List<List<String>>> getData(String satUrl) async =>
      await _satScrapingProvider.getData(satUrl);
}
