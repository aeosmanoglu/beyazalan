import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NFC {
  static reader() async {
    try {
      NFCTag tag = await FlutterNfcKit.poll();
      print(tag);
      await FlutterNfcKit.finish();
    } catch (e) {
      print(e);
      await FlutterNfcKit.finish(iosErrorMessage: e.toString());
    }
  }
}
