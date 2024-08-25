// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class LocalAuth {
  static final auth = LocalAuthentication();
  static Future<bool> canAuthenticate() async {
    return await auth.canCheckBiometrics || await auth.isDeviceSupported();
  }

  static Future<bool> authenticate() async {
    try {
      if (await canAuthenticate()) {
        return auth.authenticate(
            authMessages: const <AuthMessages>[
              AndroidAuthMessages(
                signInTitle: 'Oops !authentication required',
                cancelButton: 'No thanks',
              ),
              IOSAuthMessages(
                lockOut: 'Oops !authentication required',
                cancelButton: 'No thanks',
              )
            ],
            localizedReason:
                'for security reasons you must verify identity to open your app',
            options: const AuthenticationOptions(
                stickyAuth: true, useErrorDialogs: true));
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('e: $e');
      return false;
    }
  }
}
