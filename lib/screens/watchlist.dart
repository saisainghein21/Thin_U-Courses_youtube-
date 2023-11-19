import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/watched_list_course.dart';

import 'courses.dart';

class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: null, // Set the AppBar to null
        body: Column(
          children: [
            Container(
              color: Color(0xFF6387FF), // Set the background color
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Saved Articles',
                  ),
                  Tab(
                    text: 'My Courses',
                  ),
                ],
                labelColor: Colors.white, // Text color of the selected tab
                unselectedLabelColor:
                    Colors.black, // Text color of unselected tabs
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Article tab content (blank for now)
                  Text("article tab"),
// Course tab content
                  WatchedList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
