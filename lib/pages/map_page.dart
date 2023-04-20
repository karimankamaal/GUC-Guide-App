import 'dart:async';
import 'dart:math';
//import 'package:google_maps_utils/google_maps_utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_utils/utils/spherical_utils.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863,-71.1699932);
const LatLng DEST_LOCATION = LatLng(42.744421,-71.1698939);
//double distance = SphericalUtils.computeDistanceBetween(SOURCE_LOCATION , DEST_LOCATION );

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

Position? _currentUserPosition;
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Future _getTheDistance() async {
    _currentUserPosition =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;
  bool isSelected=false;
  bool userBadgeSelected=false;
  late LatLng currentLocation;
  late LatLng destinationLocation;
  @override
  initState() {
    super.initState();

    // set up initial locations
    this.setInitialLocation();
    //set up initial markers
    this.setSourceAndDestinationMarkerIcons();
  }
  void setInitialLocation() {
    currentLocation = LatLng(
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude
    );

    destinationLocation = LatLng(
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude
    );
  }
  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon= await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(300,300)),'lib/assets/destination_pin.png');
    destinationIcon= await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(300,300)),'lib/assets/destination_pin.png');

  }


  @override
  Widget build(BuildContext context) {

    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION
    );
    _getTheDistance();
    print("distance:");
    return  Scaffold(
        body:Stack(
      children: [
        Positioned.fill(child:
        GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            markers: _markers,
            mapType: MapType.normal,
            onTap: (LatLng loc){
             setState(() {
               this.pinPillPosition=PIN_INVISIBLE_POSITION;
               this.isSelected=false;
             });
            },
            initialCameraPosition: initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              showPinsOnMap();
            }
        )),
        AnimatedPositioned(
          duration:Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          top:80,
          left:10,
          right:10,
          child: Container(
            decoration: BoxDecoration(
              color: this.isSelected? Color(0xafff0000):Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset.zero
                )
              ]
            ),
            child:Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/solarpanel.jpeg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                    Text("Solar Park Tour", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color:Colors.grey,
                    ),),
                      Text("My Location",style: TextStyle(
                        color: Color(0xafff0000)
                      ),)
                    ],

                     )
                   ),
                Icon(Icons.location_pin,color: Color(0xafff0000),size: 40,)
                  ],
                )
          )
        ),
        AnimatedPositioned(
           duration:const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right:0,
            bottom: this.pinPillPosition,
            child:
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset.zero
                  )
                ]
              ),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                       ClipOval(child:
                         Image.asset('lib/assets/solarpanel.jpeg',
                         width: 60,
                         height: 60,
                         fit: BoxFit.cover,),
                       ),
                        SizedBox(width:20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Solar Park",style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),),
                            Text("Distance: 2 KM",style: TextStyle(
                                color: Color(0xafff0000)
                            ),)
                          ],
                        ),
                        SizedBox(width:80),
                        Icon(Icons.location_pin,color: Color(0xafff0000),size: 50,)
                      ],
                    ),
                  ),


                ],
              ),

        ))
              ],
            )
          );




  }
  void showPinsOnMap(){
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: currentLocation,
          icon:sourceIcon,
          onTap: (){
            setState(() {
              this.isSelected=true;
            });
      }
      ));
      _markers.add(Marker(
          markerId: MarkerId('destinationIcon'),
          position: destinationLocation,
          icon:destinationIcon,
           onTap: (){
            setState(() {
              this.pinPillPosition=PIN_VISIBLE_POSITION;
            });
           }
      ));
    });
  }
}
