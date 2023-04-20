
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/models/specialevents_model.dart';
import 'package:myfirstapp/pages/tours/solar_park.dart';
import 'package:myfirstapp/widgets/IconAndTextWidget.dart';
import 'package:myfirstapp/utils/dimensions.dart';
import 'package:provider/provider.dart';

import '../../widgets/column.dart';
class TourCards extends StatefulWidget {
  const TourCards({Key? key}) : super(key: key);

  @override
  State<TourCards> createState() => _TourCardsState();
}

class _TourCardsState extends State<TourCards> {
  PageController pageController= PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height =Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
      });
    });
  }
  @override
  void dispose() {
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<SpecialEvent>>(context);

    if (events==[]){
      return CircularProgressIndicator();
    }
    else {
      return Column(
          children: [


            Container(
              height: Dimensions.pageView,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: 2,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position);
                  }),
            ),
            new DotsIndicator(
              dotsCount: 2,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: Colors.lightBlue[800],
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(height: Dimensions.height30),
            Container(
              margin: EdgeInsets.only(right: 199),
              child: Text(
                  "Special Events", style: TextStyle(fontFamily: 'roboto',
                  fontSize: 22)),
            ),
            SizedBox(width: Dimensions.width10),
            // Container(
            //   width:204,
            //   height:1,
            //   color: Colors.black,
            // )

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) {
                debugPrint("hiiiiiiiii${events[index].imageURL}");
                return Container(
                  margin: EdgeInsets.only(left: Dimensions.width20, bottom: 5),
                  child: Row(
                    children: [
                      //image
                      Container(
                        height: Dimensions.listViewImgSize,
                        width: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.blue,
                        ),
                        child: events[index]?.imageURL != null
                            ? Image.network(
                          events[index]?.imageURL ?? '',
                          errorBuilder: (context, error, stackTrace) {
                            debugPrint('Failed to load image: $error');
                            return Center(
                              child: Text('Failed to load image.'),
                            );
                          },
                        )
                            : Center(child: CircularProgressIndicator(color: Colors.red,)),
                      ),

                      //text container
                      Expanded(
                          child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                      Dimensions.radius20),
                                  bottomRight: Radius.circular(
                                      Dimensions.radius20),
                                ),
                                color: Colors.white,
                              ),


                              //
                              child: AppColumn(event: events[index])
                          )
                      ),

                    ],
                  ),
                );
              },
            ),

          ]


      );
    }

  }
  Widget _buildPageItem(int index){
    Matrix4 matrix= new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if (index== _currPageValue.floor()+1){
      var currScale=_scaleFactor+ (_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index== _currPageValue.floor()-1){
      var currScale=1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix=Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                if(index==0){
                  Navigator.pushNamed(context, '/solarpark');
                }
                if(index==1){
                  Navigator.pushNamed(context, '/mrsdetail');
                }
              },
              child: Container(
                height:Dimensions.pageViewContainer,
                width:400,
                margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color:Color(0xFF69c5df)
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height:105,
                  width:320,
                  margin: EdgeInsets.only(left: 15,right: 10,bottom: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 5.0,
                            offset: Offset(0,8)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5,0)
                        ),
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(5,0)
                        )
                      ]
                  ),
                  child: Container(
                    padding:EdgeInsets.only(top:15,left:1,right: Dimensions.width15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(index == 0 ? "Solar Park Tour" : "MRS Lab Tour", style: TextStyle(
                          fontFamily: 'roboto',
                          fontSize: 26,
                        )),
                        SizedBox(height:18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndTextWidget(icon: index==1? Icons.camera_alt:Icons.pause, text: index==1?"Robots":"Audio/Video", color: Color(0xFFB6ACAC), iconColor: Colors.lightBlue),
                            IconAndTextWidget(icon: Icons.location_pin, text: index==1?"2.8km": "1.7km", color: Color(0xFFB6ACAC), iconColor: Colors.lightBlue),
                            IconAndTextWidget(icon: Icons.timer, text: index==1? "20 mins": "10 mins", color:Color(0xFFB6ACAC), iconColor:Colors.lightBlue)
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ),
          ]
      ),
    );
  }
}
class DataSearch extends SearchDelegate <String>{

  List <String> cities=[
    "Solar Park",
    "MRS Lab Tour",
  ];
  List <String> recentCities=[];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (){
    }, icon: Icon(Icons.clear))];
  }
  @override
  Widget? buildLeading(BuildContext context) {

  }
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList= query.isEmpty? recentCities:cities;
    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        leading: Icon(Icons.location_on),
        title: Text(suggestionList[index]),

      ),
      itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }
}