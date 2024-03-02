import 'package:flutter/material.dart';
import 'package:w10_e3youtbapp/models/channel_model.dart';
import 'package:w10_e3youtbapp/models/video_model.dart';
import 'package:w10_e3youtbapp/services/api_service.dart';

class ItemVideoWidget extends StatefulWidget {
  // const ItemVideoWidget({super.key});
  VideoModel videoModel;
  ItemVideoWidget({required this.videoModel});

  @override
  State<ItemVideoWidget> createState() => _ItemVideoWidgetState();
}

class _ItemVideoWidgetState extends State<ItemVideoWidget> {
  final APIService _apiService = APIService();

  ChannelModel? channel;
  getChannelData() {
    // widget.videoModel.snippet.channelId
    _apiService.getChannel("UC99OG4_C8-5Y1P04pTA7uGQ").then((value) {
      channel = value;
      //print(channel!.snippet.thumbnails.high.url);
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getChannelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // channel !=null ? print(channel!.snippet.description) : print("");
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: channel == null ? Column(
        children: [
          Stack(children: [
            Image.network(
              widget.videoModel.snippet.thumbnails.high.url,
              width: double.infinity,
              height: height * 0.25,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.black.withOpacity(0.7),
                child: Text(
                  "23:22",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ]),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Colors.white12,
              // backgroundImage: NetworkImage(channel!.snippet.thumbnails.high.url),
              backgroundImage: NetworkImage("https://www.blogdelfotografo.com/wp-content/uploads/2022/05/portada-video-fotos.webp"),
            ),
            title: Text(
              widget.videoModel.snippet.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            subtitle: Text(
              "${widget.videoModel.snippet.channelTitle} · 6.5 M de vistas · hace 2 años",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
            trailing: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ) : Container(),
    );
  }
}
