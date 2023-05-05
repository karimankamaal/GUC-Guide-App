import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myfirstapp/authentication/authentication.dart';
import 'package:myfirstapp/controllers/special_events_controller.dart';
import 'package:myfirstapp/models/user.dart';
import 'package:myfirstapp/pages/admin/add_robot.dart';
import 'package:myfirstapp/pages/admin/admin_homepage.dart';
import 'package:myfirstapp/pages/admin/create_user.dart';
import 'package:myfirstapp/pages/admin/edit_event.dart';
import 'package:myfirstapp/pages/admin/edit_robot.dart';
import 'package:myfirstapp/pages/admin/edit_robot_details.dart';
import 'package:myfirstapp/pages/admin/event_edit.dart';
import 'package:myfirstapp/pages/tours/directions.dart';
import 'package:myfirstapp/pages/admin/events_form.dart';
import 'package:myfirstapp/pages/home/homepage.dart';
import 'package:myfirstapp/pages/admin/log_in.dart';
import 'package:myfirstapp/pages/map_page.dart';
import 'package:myfirstapp/pages/map_screen.dart';
import 'package:myfirstapp/pages/onboarding.dart';
import 'package:myfirstapp/pages/home/search.dart';
import 'package:myfirstapp/pages/tours/MRS_lab_tour.dart';
import 'package:myfirstapp/pages/tours/MRS_tour_detail.dart';
import 'package:myfirstapp/pages/tours/audio_tour_final.dart';
import 'package:myfirstapp/pages/tours/MRS_directions.dart';
import 'package:myfirstapp/pages/tours/robot_detail.dart';
import 'package:myfirstapp/pages/tours/solar_park.dart';
import 'package:myfirstapp/pages/event_detail.dart';
import 'package:myfirstapp/pages/tours/solar_tour_detail.dart';
import 'package:myfirstapp/services/auth.dart';
import 'package:myfirstapp/services/notification_service.dart';
import 'package:myfirstapp/widgets/column.dart';
import 'package:myfirstapp/wrapper.dart';
import 'helper/dependencies.dart'as dep;
import 'package:provider/provider.dart';

import 'models/specialevents_model.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp();
  // await FirebaseMessaging.instance.requestPermission();
  // await FirebaseMessaging.instance.subscribeToTopic('all_users');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return StreamProvider<MyUser?>.value(
        value:AuthService().user,
        initialData:null,
        child:GetMaterialApp(

          title: 'Flutter Demo',
          home: MyHomePage(title: "whatever",),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/directions',
          routes: <String,WidgetBuilder>{
            '/authenticate':(c)=>Authenticate(),
            '/homepage':(c)=> HomePage(),
            '/solarpark':(c)=>SolarPark(),
            '/mrstour':(c)=> MRSTour(),
            '/mrsdetail': (c)=>MRSDetail(),
            '/directions':(c)=> Directions(),
            '/eventsform':(c)=> EventsForm(),
            '/eventdetail':(c)=>EventDetail(),
            '/solardetail':(c)=>SolarParkTourPage(),
            '/audiotour':(c)=> AudioTour(),
            '/search':(c)=> Search(),
            '/adminhomepage':(c)=> AdminHomepage(),
            '/createuser':(c)=> CreateUser(),
            '/editevent':(c)=> EditEvent(),
            '/eventedit':(c)=>EventEdit(),
            '/addrobot':(c)=>AddRobot(),
            '/robotdetail':(c)=>RobotDetail(),
            '/mrsdirection':(c)=> MRSDirections(),
            '/editrobot':(c)=> EditRobot(),
            '/editrobotdetail':(c)=>EditRobotDetail()


          },
        )
    );
  }

}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationService.initialize(context);

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });



  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePage();
  }
}