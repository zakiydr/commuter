import 'package:commuter/models/station_model.dart';
import 'package:dio/dio.dart';

import '../models/schedule_model.dart';

class CommuterServices {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.api.comuline.com',
    ),
  );

  Future<StationModel> getStation() async {
    try {
      final Response response = await dio.get('/v1/station/');
      if (response.statusCode == 200) {
        // final data = response.data['data'];
        StationModel? stationModel = StationModel.fromJson(response.data);

        // for (var item in data) {
        //   stationModel.add(StationModel.fromJson(item));
        // }

        return stationModel;
      } else {
        throw Exception('${response.statusCode} : ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<StationData> getStationById(String id) async {
    try {
      final Response response = await dio.get('/v1/station/$id');
      if (response.statusCode == 200) {
        // final data = response.data['data'];
        StationData? stationModel = StationData.fromJson(response.data['data']);

        // for (var item in data) {
        //   stationModel.add(StationModel.fromJson(item));
        // }

        return stationModel;
      } else {
        throw Exception('${response.statusCode} : ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ScheduleModel> getSchedule(String stationId) async {
    try {
      final Response response = await dio.get('/v1/schedule/${stationId}');

      if (response.statusCode == 200) {
        ScheduleModel? scheduleModel = ScheduleModel.fromJson(response.data);

        return scheduleModel;
      } else {
        throw Exception('${response.statusCode} : ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ScheduleModel> getRoute(String trainId) async {
    try {
      final Response response = await dio.get('/v1/route/$trainId');

      if (response.statusCode == 200) {
        ScheduleModel? routeModel = ScheduleModel.fromJson(response.data);

        return routeModel;
      } else {
        throw Exception('${response.statusCode} : ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
