import 'package:get/get.dart';
import 'package:myfirstapp/data/api/api_client.dart';

class SpecialEventsRepo extends GetxService{
  final ApiClient apiClient;

  SpecialEventsRepo({required this.apiClient});

  Future<Response> getSpecialEvents()async{
 return await apiClient.getData("end point url","d");
  }

}