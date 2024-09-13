import 'package:commuter/services/commuter_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';
import '../../models/schedule_model.dart';
import '../../models/station_model.dart';
import '../../utils/shared_pref.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());
    return Obx(() => controller.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    controller.textController.value = value;
                    controller.onSearch();
                  },
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.savedStations.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(controller
                                        .savedStations[index].name
                                        .toString()),
                                  ),
                                ],
                              );
                            },
                          ),
                          Divider(),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: controller.searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                    "${controller.searchResults[index].name}"),
                                onTap: () {
                                  Get.find<MainController>().fetchSchedule(
                                      '${controller.searchResults[index].id}');
                                  Get.find<MainController>().fetchStationById(
                                      '${controller.searchResults[index].id}');
                                  controller.saveStation(
                                      controller.searchResults[index]);
                                },
                              );
                            },
                          ),
                        ],
                      )),
              )
            ],
          ));
  }
}

// class SecondPage extends StatelessWidget {
//   SecondPage({
//     super.key,
//   });

//   //Dio Client
//   final CommuterServices _client = CommuterServices();

//   //
//   final LocalData _local = LocalData(); 

//   //

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _client.getStation(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           StationModel? stationData = snapshot.data;
//           return ListView.separated(
//             separatorBuilder: (context, index) {
//               return Divider();
//             },
//             itemCount: stationData!.data!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(stationData.data![index].name.toString()),
//                 onTap: () async {
//                   final stationId = stationData.data![index].id;
//                   debugPrint('$stationId');
//                   await _client.getSchedule(stationId!);
//                   ScheduleModel? schedule;
//                   debugPrint(schedule!.data![index].line);
//                   // debugPrint(getSchedule);
//                   // debugPrint('${_local.saveLocal('schedule', getSchedule)}'); 
//                   // await _local.saveJson(getSchedule, 'scheduleData');
//                   // _local.getJsonData();
//                 },
//               );
//             },
//           );
//         }
//         return Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
