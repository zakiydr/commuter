import 'package:commuter/services/commuter_services.dart';
import 'package:get/get.dart';

Future<void> registerService() async {
  Get.put(
    CommuterServices(),
  );
}
