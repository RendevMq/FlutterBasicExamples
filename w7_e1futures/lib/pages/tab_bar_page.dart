import 'package:flutter/material.dart';
import 'package:w7_e1futures/pages/container_page.dart';
import 'package:w7_e1futures/pages/practice_future_page.dart';

class TabBarPage extends StatelessWidget {
  // const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TABBAR PAGE"),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "screen1"),
              Tab(text: "screen2"),
              Tab(text: "screen3"),
              Tab(text: "screen4"),
              Tab(text: "screen5"),
              Tab(text: "screen6"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Center(child: Text("Esta es la pantalla 1")),
            // Center(child: Text("Esta es la pantalla 2")),
            PracticeFuturePage(),
            ContainerPage(),
            Center(child: Text("Esta es la pantalla 3")),
            Center(child: Text("Esta es la pantalla 4")),
            Center(child: Text("Esta es la pantalla 5")),
            Center(child: Text("Esta es la pantalla 6")),
          ],
        ),
      ),
    );
  }
}
