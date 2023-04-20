import 'package:flutter/cupertino.dart';
import 'package:myfirstapp/pages/admin/log_in.dart';

import '../pages/onboarding.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showOnBoarding=true;
  void toggleView(){
    setState(()=>showOnBoarding=!showOnBoarding);
  }
  @override
  Widget build(BuildContext context) {
    if(showOnBoarding){
      return OnBoarding(toggleView:toggleView) ;
    }else{
       return LoginForm(toggleView:toggleView);
    }

  }
}
