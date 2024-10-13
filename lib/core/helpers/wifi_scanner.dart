import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:make_qr/core/constants/translation.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiScanner {
  Future<void> scanForNetworks(String ssid, String password) async {
    log("111");
    try {
      if (await getCurrentLocation()) {
        log("222");

        final can = await WiFiScan.instance.canStartScan(askPermissions: true);
        log("can $can");

        if (can == CanStartScan.yes) {
          await turnOnWiFi();
          await WiFiScan.instance.startScan();
          final accessPoints = await WiFiScan.instance.getScannedResults();
          for (var network in accessPoints) {
            if (network.ssid == ssid) {
              await connectToNetwork(ssid, password);
              break;
            }
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (permission != LocationPermission.denied) {
        if (!isServiceEnabled) {
          await Geolocator.getCurrentPosition();
        }
        log("accrss allowed");
        return true;
      }
    } catch (e) {
      log("access denied");

      throw Translation.somethingWentWrong;
    }
    log("22222");
    return false;
  }

  connectToNetwork(String ssid, String password) async {
    await WiFiForIoTPlugin.connect(
      ssid,
      password: password,
      security: NetworkSecurity.WPA,
    );
    log("connected");
  }

  Future<void> turnOnWiFi() async {
    try {
      bool isEnabled = await WiFiForIoTPlugin.isEnabled();
      if (!isEnabled) {
        await WiFiForIoTPlugin.setEnabled(true, shouldOpenSettings: true);
      }
    } catch (e) {
      throw Translation.somethingWentWrong;
    }
  }
}
