import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/models/specialevents_model.dart';
import 'package:myfirstapp/pages/event_detail.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}


class _SearchState extends State<Search> {
  List events=[];
  TextEditingController _controller = TextEditingController();


  void searchFromFirebase(String query) async {
    if (query.isEmpty) {
      // If query is empty, clear the search results
      setState(() {
        events.clear();
      });
      return;
    }
    final result = await FirebaseFirestore.instance.collection('events')
        .where('title_lowercase', isGreaterThanOrEqualTo: query.toLowerCase())
        .where('title_lowercase', isLessThan: query.toLowerCase() + 'z')
        .get();
    setState(() {
      events = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
        Column(
            children:[
              Container(
                margin: EdgeInsets.only(top:40),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 0.5),
                      ),
                      hintText: "Search for any event",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: (){
                          Navigator.pushNamed(context, '/homepage');
                          setState(() {
                             events.clear();
                          });
                          _controller.clear();
                        },
                      ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 30,
                    ),
                  ),
                  onChanged: (query){
                    searchFromFirebase(query);
                  },
                )
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap:(){ Navigator.pushNamed(context, '/eventdetail',
                              arguments: SpecialEvent(title: events[index]['title'],location:events[index]['location'],description: events[index]['description'],date: events[index]['date'],time:events[index]['time']));},
                          child: ListTile(
                            title: Text(events[index]['title']),
                            subtitle: Text(events[index]['location']),
                          ),
                        );
                      })
              ),
            ]
        )
    );
  }
}