import 'package:app_youtube/api.dart';
import 'package:app_youtube/model/video.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Future<List<Video>> _listarVideos() {
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<List<Video>>(
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){
              return ListView.separated(
                itemBuilder: (context, index){
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];
                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(video.imagem)
                          )
                        ),
                      ),
                      ListTile(
                        title: Text(video.titulo),
                        subtitle: Text(video.canal),
                      )
                    ],
                  );
                }, 
                separatorBuilder: (context, index) {
                 return Divider(color: Colors.grey, height: 2,);
                }, 
                itemCount: snapshot.data.length
                );
            } else {
              return Center(child: Text("Nenhum dado a ser exibido!"),);
            }
            break;
            
        }
      },
      future: _listarVideos(),
    );
  }
}