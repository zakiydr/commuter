import 'dart:convert';

import 'package:commuter/models/schedule_model.dart';
import 'package:commuter/models/station_model.dart';
import 'package:commuter/services/commuter_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchStation();
    loadSavedStations();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // Selected station
  var savedStations = <StationData>[].obs;

  void saveStation(StationData station) async {
    savedStations.add(station);
    listStation.value.data!.remove(station);
    await saveToLocalStorage();
  }

  Future<void> saveToLocalStorage() async {
    final prefs = await SharedPreferencesAsync();
    List<String> savedList =
        savedStations.map((station) => station.toJson().toString()).toList();
    await prefs.setStringList('savedStations', savedList);
  }

  Future<void> loadSavedStations() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('savedStations');
    if (savedList != null) {
      savedStations.value = savedList
          .map((station) => StationData.fromJson(jsonDecode(station)))
          .toList();
    }
  }

  // void insertStation()

  // Bottom Navigation
  var selectedIndex = 0;

  void bottomNavTapped(int index) {
    selectedIndex = index;
    update();
  }

  // Station Search
  var textController = ''.obs;
  var searchResults = <StationData>[].obs;

  void onSearch() {
    if (textController.value.isEmpty) {
      // If the search text is empty, show all stations
      searchResults.value = listStation.value.data!;
    } else {
      // Otherwise, filter the list based on the search text
      searchResults.value = listStation.value.data!
          .where((item) => item
              .toJson()
              .toString()
              .toLowerCase()
              .contains(textController.value.toLowerCase()))
          .toList();
    }
    update();
  }

  // API Service
  CommuterServices _client = CommuterServices();

  // Station
  final listStation = StationModel().obs;
  final stationModel = StationData().obs;

  void fetchStation() async {
    try {
      isLoading(true);
      final stations = await _client.getStation();
      listStation.value = stations;
      onSearch();
      // if (stations.data != null) {
      //   selectedStation.addAll(stations.data!);
      // }
    } finally {
      isLoading(false);
    }
  }

  void fetchStationById(String id) async {
    try {
      isLoading(true);
      final stations = await _client.getStationById(id);
      stationModel.value = stations;
    } finally {
      isLoading(false);
    }
  }

  // Schedule
  final scheduleModel = ScheduleModel().obs;

  void fetchSchedule(String id) async {
    try {
      isLoading(true);
      final schedules = await _client.getSchedule(id);
      scheduleModel.value = schedules;
    } finally {
      isLoading(false);
    }
  }

  // Route
  void fetchRoute(String id) async {
    try {
      isLoading(true);
      final schedules = await _client.getRoute(id);
      scheduleModel.value = schedules;
    } finally {
      isLoading(false);
    }
  }
}
