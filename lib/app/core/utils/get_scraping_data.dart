import '../../data/repositories/remote/sat_scraping_repository.dart';

class ScrapingData {
  final SatScrapingRepository satScrapingRepository;
  final String satUrl;

  ScrapingData({
    required this.satScrapingRepository,
    required this.satUrl,
  });
}

Future<List<List<String>>> getScrapingData(ScrapingData arguments) async =>
    await arguments.satScrapingRepository.getData(arguments.satUrl);
