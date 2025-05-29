import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigService {
  static late final String homePageBanner;
  static late final String addedVices;

  static void initialize() {
    homePageBanner = dotenv.env['home_page_banner'] ?? '';
    addedVices = dotenv.env['added_vices'] ?? '';
  }

  static void initializeTest() {
    homePageBanner = 'ca-app-pub-3940256099942544/9214589741';
    addedVices = 'ca-app-pub-3940256099942544/1033173712';
  }
}
