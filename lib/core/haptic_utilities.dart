import "dart:io" show Platform;
import "package:flutter/services.dart";

void lightHaptic() {
  if (Platform.isIOS) {
    HapticFeedback.lightImpact();
  }
}

void vibrateHaptic() {
  if (Platform.isIOS) {
    HapticFeedback.heavyImpact();
  } else {
    HapticFeedback.vibrate();
  }
}
