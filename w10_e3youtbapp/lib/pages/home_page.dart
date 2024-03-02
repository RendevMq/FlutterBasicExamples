import 'package:flutter/material.dart';
import 'package:w10_e3youtbapp/models/video_model.dart';
import 'package:w10_e3youtbapp/services/api_service.dart';
import 'package:w10_e3youtbapp/ui/general/colors.dart';
import 'package:w10_e3youtbapp/ui/widgets/item_filter_widget.dart';
import 'package:w10_e3youtbapp/ui/widgets/item_video_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  final APIService _apiService = APIService();

  List<VideoModel> videos = [];
  //Metodo que se encargue de traer la informacion
  getData() {
    _apiService.getVideos().then((value) {
      videos = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //_apiService.getVideos();
    _apiService.getChannel("UC99OG4_C8-5Y1P04pTA7uGQ");
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Container(
            child: videos != [] ? Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kBrandSecondaryColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {},
                        icon: const Icon(Icons.explore_outlined,
                            color: Colors.white),
                        label: const Text(
                          "Explorar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                        child: VerticalDivider(
                          color: Colors.white30,
                          thickness: 1,
                        ),
                      ),
                      ItemFilterWidget(text: "Todos", isSelected: true),
                      ItemFilterWidget(text: "Mixes", isSelected: false),
                      ItemFilterWidget(text: "Música", isSelected: false),
                      ItemFilterWidget(text: "Programacion", isSelected: false),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemVideoWidget(
                      videoModel: videos[index],
                    );
                  },
                )
              ],
            ) : Center(child: CircularProgressIndicator(),),
          ),
        ),
      ),
    );
  }
}
