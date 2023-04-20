import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myfirstapp/controllers/special_events_controller.dart';
import 'package:myfirstapp/data/api/api_client.dart';
import 'package:myfirstapp/data/repository/special_events_repo.dart';

Future<void> init() async{
  //api client
Get.lazyPut(()=>ApiClient(appBaseUrl: "end point url"));

//repos
Get.lazyPut(() => SpecialEventsRepo(apiClient: Get.find()));

//controllers
Get.lazyPut(() => SpecialEventsController(specialEventsRepo: Get.find()));

}