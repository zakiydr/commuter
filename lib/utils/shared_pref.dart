import 'dart:convert';

import 'package:commuter/models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  // final prefs = await SharedPreferencesAsync
  Future saveLocal(key, value) async {
    final prefs = await SharedPreferencesAsync();
    await prefs.setString(key, value);
  }

  Future<void> getLocal(key) async {
    final prefs = await SharedPreferencesAsync();
    await prefs.getString(key);
  }
}
