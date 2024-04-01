// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class LocalAuth {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> canDoLocalAuthentication() async {
    return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
  }

  static Future<bool> doAuthentication() async {
    try {
      if (!await canDoLocalAuthentication()) {
        return false;
      }
      return await _auth.authenticate(
        authMessages: const [
          AndroidAuthMessages(
            signInTitle: "Sign in",
            cancelButton: "No Thanks",
          ),
          IOSAuthMessages(
            cancelButton: "No Thanks",
          ),
        ],
        localizedReason: 'Security',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      debugPrint('Error Message: $e');
      return false;
    }
  }
}
