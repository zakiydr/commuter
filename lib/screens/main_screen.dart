import 'package:commuter/controller/main_controller.dart';
import 'package:commuter/models/station_model.dart';
import 'package:commuter/services/commuter_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/schedule_model.dart';
import '../utils/shared_pref.dart';
import 'pages/first_page.dart';
import 'pages/second_page.dart';

class MainScreen extends GetView<MainController> {
  MainScreen({super.key});

  //Shared Preference
  final LocalData _local = LocalData();

  final prefs = SharedPreferencesAsync();

  // final stationList = prefs.
  // Controller
  // final controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Commuter'),
          actions: [
            IconButton(
                onPressed: () {
                  prefs.remove('schedule');
                },
                icon: Icon(Icons.delete),)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: controller.bottomNavTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            FirstPage(),
            SecondPage(),
          ],
        ),
      );
    });
  }
}
