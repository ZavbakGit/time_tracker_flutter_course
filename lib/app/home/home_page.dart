import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home/tab_item.dart';

import 'cupertino_home_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectedTab: (item) {},
    );
  }
}
