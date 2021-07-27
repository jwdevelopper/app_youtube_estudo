import 'package:app_youtube/model/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
const YOUTUBE_CHAVEAPI = "AIzaSyAgrqs7j5KPxXlln1Evf4Xl0b--4lCCjTY";
const ID_CANAL = "UCplT2lzN6MHlVHHLt6so39A";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {
    Uri uri = Uri.parse(URL_BASE + "search" + "?part=snippet" + "&type=video" + "&maxResults=20" 
    + "&order=date" + "&key=$YOUTUBE_CHAVEAPI" + "&channelId=$ID_CANAL" + "&q=$pesquisa");
    http.Response response = await http.get(uri);

    if(response.statusCode == 200){
      response.body;
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map){return Video.fromJson(map);}).toList();
      return videos;
      /*for(var video in videos){
        print("TITULO DO VIDEO => " + video.titulo);
      }*/

      print("resultado => " + dadosJson["items"][0].toString());
    } else {

    }
  }

}