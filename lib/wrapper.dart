import 'package:flutter/cupertino.dart';
import 'package:myfirstapp/authentication/authentication.dart';
import 'package:myfirstapp/pages/admin/events_form.dart';
import 'package:myfirstapp/pages/home/homepage.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final user= Provider.of<MyUser?>(context);
   print(user);
   if(user==null){
     return Authenticate();
   }
    else{
      return EventsForm();
   }
  }
}
