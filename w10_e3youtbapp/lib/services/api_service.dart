import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:w10_e3youtbapp/models/channel_model.dart';
import 'package:w10_e3youtbapp/models/video_model.dart';
import 'package:w10_e3youtbapp/utils/constants.dart';

class APIService {
  Future<List<VideoModel>> getVideos() async {
    List<VideoModel> videosModel = [];
    String _path =
        "$pathProduction/search?part=snippet&key=$apiKey&maxResults=30&regionCode=PE";
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap["items"];
      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList();
      return videosModel;
    }
    return videosModel;
  }

  Future<ChannelModel?> getChannel(String channeID) async {
    ChannelModel? channel;
    String _path =
        "$pathProduction/channels?part=snippet&id=$channeID&key=$apiKey";
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      myMap = myMap["items"][0];
      channel = ChannelModel.fromJson(myMap);
      print(channel.snippet.thumbnails.high.url);
      return channel;
    }
    return channel;

  }
}
