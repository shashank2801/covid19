import 'package:Covid19/ui/dashboard_screen.dart';
import 'package:Covid19/ui/data.dart';
import 'package:Covid19/ui/protectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3,vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          Dashboard(),
          Data(),
          Prevention(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Color(0xffc62828),
        child: TabBar(
          controller: tabController,
          tabs: [
            Tab(icon: Icon(FontAwesomeIcons.infoCircle)),
            Tab(icon: Icon(FontAwesomeIcons.search),),
            Tab(icon: Icon(FontAwesomeIcons.hospitalUser),),
          ],
        ),
      ),
    );
  }
}

