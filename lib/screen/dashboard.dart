import 'package:flutter/material.dart';
import 'package:flutter_ecomplaint/config/color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Image.asset('assets/logo/logo-complainz-blue.png', 
        fit: BoxFit.cover,
        height: 30,
        ),
        )
      
    ); 
  }
}