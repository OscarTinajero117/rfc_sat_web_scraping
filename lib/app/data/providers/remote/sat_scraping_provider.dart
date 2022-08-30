import 'dart:developer';

import 'package:beautiful_soup_dart/beautiful_soup.dart';

import '../../../core/utils/http/sat_http_scraping.dart';

class SatScrapingProvider {
  Future<List<List<String>>> getData(String satUrl) async {
    try {
      final html = await SatHttpScraping.getData(satUrl);
      if (html != null) {
        final soup = BeautifulSoup(html);
        final tables = soup.findAll('table', class_: 'ui-panelgrid');
        List<List<String>> elementsTable = [];
        for (var row in tables) {
          final elements = row
              .findAll('td', attrs: {'style': "text-align:left;"})
              .map((e) => e.text)
              .toList();
          elementsTable.add(elements);
        }
        return elementsTable;
      }
    } catch (e) {
      log('SatScrapingProvider $e');
    }
    return [];
  }
}
