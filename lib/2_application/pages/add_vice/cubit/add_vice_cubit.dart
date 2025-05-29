// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vicefree/2_application/core/services/app_config_service.dart';
import 'package:vicefree/2_application/core/services/date_format_service.dart';
import 'package:vicefree/2_application/core/services/sqflite_service.dart';

part 'add_vice_state.dart';

class AddViceCubit extends Cubit<AddViceState> {
  AddViceCubit() : super(AddViceInitial());

  InterstitialAd? interstitialAd;

  TextEditingController viceNameController = TextEditingController();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void onInitial() {
    loadInterstitialAd();
  }

  void changeColor(Color color) {
    pickerColor = color;
    emit(BackgroundColorOnChanged());
  }

  Future<void> onSave() async {
    var backgroundColor = colorToHexLiteral(pickerColor);

    DatabaseHelper db = DatabaseHelper();

    final now = DateTime.now().toIso8601String();
    await db.saveVice({
      'viceName': viceNameController.text,
      'backgroundColor': backgroundColor,
      'timestamp': stringDateToTimestamp(now),
    });

    emit(Saved());
  }

  String colorToHexLiteral(Color color) {
    return '0x${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AppConfigService.addedVices,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          emit(OnClosed());
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          emit(OnClosed());
        },
      );

      interstitialAd!.show();
      interstitialAd = null;
    } else {
      print('Interstitial ad is not ready yet.');
    }
  }
}
