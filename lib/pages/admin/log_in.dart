import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:myfirstapp/services/auth.dart';

class LoginForm extends StatefulWidget {

  final Function toggleView;
  LoginForm({required this.toggleView});

  @override
  _LoginFormState createState() => _LoginFormState();

}

class _LoginFormState extends State<LoginForm> {
  final AuthService _auth=AuthService();
  String error='';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
          actions: [
            IconButton(onPressed: (){
              widget.toggleView();
            },
                icon: Icon(Icons.arrow_back)
            ),
          ]
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:180.0, right:40.0, left:40.0),
        child: SingleChildScrollView(
            child:Form(

          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  depth: 5.0,
                  intensity: 0.7,
                  shape: NeumorphicShape.convex,
                  lightSource: LightSource.topLeft,
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Neumorphic(
                style: NeumorphicStyle(
                  depth: 5.0,
                  intensity: 0.7,
                  shape: NeumorphicShape.convex,
                  lightSource: LightSource.topLeft,
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              NeumorphicButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    dynamic result=await _auth.signInWithEmailAndPassword(email, password);
                   if(result==null){
                     print("hii");
                     setState(() {
                       error="could not sign in with those credentials.";
                     });
                   }
                   else{
                     setState(() {
                       error="";
                       Navigator.pushNamed(context, '/adminhomepage');
                     });

                   }
                  }
                },
                style: NeumorphicStyle(
                  depth: 5.0,
                  intensity: 0.7,
                  shape: NeumorphicShape.convex,
                  lightSource: LightSource.topLeft,
                ),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Text(error,style: TextStyle(color: Colors.red,fontSize: 14),)
            ],
          ),
        ),
      ),
      )
    );
  }
}
