// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  String appVersion = '';

  Future<void> onInitial() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    appVersion = 'App version:\n$version ($buildNumber)';
    emit(Loaded());
  }
}
