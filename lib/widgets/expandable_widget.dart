import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText( {Key? key,  required this.text,}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHeight= Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0,textHeight.toInt());
      secondHalf= widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Text(firstHalf,style: TextStyle(fontSize: 15,fontFamily: 'robotoT'),):Column(
        children: [
          Text(hiddenText?firstHalf+"...":firstHalf+secondHalf, style: TextStyle(fontSize: 15,fontFamily: 'robotoT'),),
          InkWell(
            onTap: (){
            setState(() {
              hiddenText=!hiddenText;
            });
            },
            child: Row(
              children: [
                Text("Show more",style:TextStyle(fontSize: 15,fontFamily: 'robotoT',color: Colors.blue) ,),
                Icon(hiddenText?Icons.arrow_drop_down: Icons.arrow_drop_up,color: Colors.blue,)
              ],
            ),
          )
        ],
      )

    );
  }
}
