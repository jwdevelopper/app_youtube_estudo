import 'package:http/http.dart' as http;
import 'dart:convert';
const YOUTUBE_CHAVEAPI = "AIzaSyAgrqs7j5KPxXlln1Evf4Xl0b--4lCCjTY";
const ID_CANAL = "UCplT2lzN6MHlVHHLt6so39A";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  pesquisar(String pesquisa) async {
    Uri uri = Uri.parse(URL_BASE + "search" + "?part=snippet" + "&type=video" + "&maxResults=20" 
    + "&order=date" + "&key=$YOUTUBE_CHAVEAPI");
    http.Response response = await http.get(uri);
  }

}