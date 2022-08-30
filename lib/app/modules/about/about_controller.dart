import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/values/date_time_format.dart';

class AboutController extends GetxController {
  String getYear() {
    String year = dateWithOutHyphen().substring(0, 4);
    return year;
  }

  Future<void> toUrl(String site) async {
    if (await canLaunchUrl(Uri.parse(site))) {
      await launchUrl(
        Uri.parse(site),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $site';
    }
  }
}
