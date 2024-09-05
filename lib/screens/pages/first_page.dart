// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:commuter/controller/main_controller.dart';
import 'package:commuter/services/commuter_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/shared_pref.dart';

class FirstPage extends StatelessWidget {
  FirstPage({
    Key? key,
  });

  // // Station List
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.scheduleModel.value.data == null
            ? Center(
                child: Text('Pilih Stasiun'),
              )
            : ListView.separated(
                itemCount: controller.savedStations.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Stasiun'),
                              Text(''
                                  // controller.savedStations[index].name
                                  //     .toString(),
                                  ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 16,
                  );
                },
              )
        // ListView.builder(
        //     itemCount: controller.scheduleModel.value.data!.length,
        //     itemBuilder: (context, index) {
        //       return Card(
        //         child: ListTile(
        //             title: Text('${controller.stationModel.value.name}')),
        //       );
        //     },
        //   )
        // ReorderableListView.builder(
        //     itemBuilder: (context, index) {
        //       return Card(
        //         child: Text('data'),
        //       );
        //     },
        //     itemCount: controller.scheduleModel.value.data!.length,
        //     onReorder: (oldIndex, newIndex) => ,
        // )
        );
    // FutureBuilder(
    //   future: _client.getStation(),
    //   builder: (context, snapshot) {
    //     return ListView.builder(
    //       shrinkWrap: true,
    //       itemBuilder: (context, index) {
    //         return Container(
    //           child: Text("${_local.getLocal('schedule')}"),
    //         );
    //       },
    //     );
    //     // ReorderableListView(
    //     //   onReorder: (oldIndex, newIndex) => updateItem(oldIndex, newIndex),
    //     //   children: [
    //     //     for (final item in _tempList)
    //     //       ListTile(
    //     //         key: ValueKey(item),
    //     //         title: Text(item),
    //     //       ),
    //     //   ],
    //     // );
    //   },
    // );
  }
}
