import 'package:flutter/foundation.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NFC {
  // FIXME
  static Future<String> getID() async {
    try {
      NFCTag tag = await FlutterNfcKit.poll();
      await FlutterNfcKit.finish();
      return tag.id;
    } catch (e) {
      debugPrint(e.toString());
      await FlutterNfcKit.finish(iosErrorMessage: e.toString());
      return "00000000";
    }
  }
}
