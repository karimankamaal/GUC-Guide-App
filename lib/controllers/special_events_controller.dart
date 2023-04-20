import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:myfirstapp/data/repository/special_events_repo.dart';

import '../models/specialevents_model.dart';

class SpecialEventsController extends GetxController{
final SpecialEventsRepo specialEventsRepo;
SpecialEventsController({required this.specialEventsRepo});
List<dynamic> _specialEventsList=[];
List<dynamic> get specialEventsList=>_specialEventsList;
Future<void> getSpecialeventsList()async{
 Response response= await specialEventsRepo.getSpecialEvents();
 if(response.statusCode==200){
   _specialEventsList=[];
   _specialEventsList.add(SpecialEvent.fromJson(response.body));
   update();
 }else{

 }
}

}