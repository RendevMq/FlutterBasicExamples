import 'package:flutter/material.dart';
import 'package:w7_e2whatsappclon/pages/call_pages.dart';
import 'package:w7_e2whatsappclon/pages/chat_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

//Uilizamos un mixin.. con el with , nos ayuddar a gestionar algunas animaciones
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // const HomePage({super.key});

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("INIT STATE");
    _tabController = TabController(
        length: 4, vsync: this); //this , para que haga referencia a esta clase
  }

  @override
  Widget build(BuildContext context) {
    // print("BUILDD");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        child: Icon(Icons.message),
      ),
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 3.5,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text(
                "CHAT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "STATUS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              child: Text(
                "CALLS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text("Camera")),
          ChatPage(),
          Center(child: Text("Status")),
          CallPage(),]
      ),
    );
  }
}
