import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/models/specialevents_model.dart';
import 'package:myfirstapp/pages/home/tour_card.dart';
import 'package:myfirstapp/services/database.dart';
import 'package:myfirstapp/utils/dimensions.dart';
import 'package:provider/provider.dart';

import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("current width is "+ MediaQuery.of(context).size.width.toString());
    List events=[];
    void searchFromFirebase (String query)async{
      final result=await FirebaseFirestore.instance.collection('events')
          .where('title', isEqualTo: query )
          .get();

      setState((){
        events=result.docs.map((e) => e.data()).toList();
      });
    }

    return StreamProvider<List<SpecialEvent>>.value(
      catchError: (context, error) {
        print(error);
        return [];
      },
      initialData: [],
      value: DatabaseService().events,
      child: Scaffold(
          body: Column(
            children: [
              Container(
                  child: Container(
                      margin: EdgeInsets.only(top:45,bottom: 15),
                      padding:EdgeInsets.only(left: 20,right:20),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("GUC", style: TextStyle(
                                fontFamily: 'misto',
                                letterSpacing: 12,
                                fontSize: 24,
                                color: Colors.lightBlue[800],
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("GUIDE", style: TextStyle(
                                fontFamily: 'misto',
                                letterSpacing: 12,
                                fontSize: 24,
                                color: Colors.lightBlue[800],
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                InkWell(
                  onTap: (){
                   Navigator.pushNamed(context, '/search');
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search,color:Colors.white, size: Dimensions.iconSize24,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius10),
                        color: Color(0xff1c1b1f)
                    ),
                  ),
                ),
                        ],
                      )
                  )
              ),
              Expanded(child: SingleChildScrollView(
                  child: TourCards()
              )),
            ],
          )
      ),
    ) ;
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