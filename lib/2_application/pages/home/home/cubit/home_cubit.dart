import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vicefree/0_data/models/vices_model.dart';
import 'package:vicefree/2_application/core/services/sqflite_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<VicesModel> list = [];
  late BannerAd bannerAd;
  bool isAdLoaded = false;

  Future<void> onInitial() async {
    emit(Loading());

    DatabaseHelper db = DatabaseHelper();
    final List<Map<String, dynamic>> vices = await db.fetchVices();

    if (vices.isEmpty) {
      emit(NoRecord());
      return;
    }

    for (var item in vices) {
      VicesModel model = VicesModel.fromJson(item);
      list.add(model);
    }

    bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // test ad unit
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          isAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('Ad failed to load: $error');
        },
      ),
    )..load();

    emit(Success());
  }

  Future<void> onRefresh() async {
    emit(OnRefresh());
  }
}
