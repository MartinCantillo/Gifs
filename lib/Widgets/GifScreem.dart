import 'package:flutter/material.dart';
import 'package:gif/Models/Gifts.dart';
import 'package:gif/Provider/GifService.dart';

class GifScreem extends StatefulWidget {
  const GifScreem({super.key});

  @override
  State<GifScreem> createState() => _GifScreemState();
}

class _GifScreemState extends State<GifScreem> {
  late Future<List<Datum>> gifsList;
  @override
  void initState() {
    super.initState();
    gifsList = GiftServic.fecthGifs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gifs"),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: gifsList,
          builder: (context, snapshot) {
           // print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            else if (gifsList == null) {
              return Center(child: Text('El snapshot es nulo'));
            } else {
            
              return ListView(children: Upload(snapshot.data),) ;
            }
          },
        ),
      ),
    );
  }

//Construyo los widgets
  //Construyo los widgets
  List<Widget> Upload(  gifs) {
    List<Widget> uploadGifs = [];

    // Verificar si gifs no es nulo
    if (gifs != null) {
      // Iterar sobre la lista de Gifs
      for (var element in gifs) {
        // Iterar sobre la lista de Datum dentro de cada Gifs

          uploadGifs.add(Text(element.url));
        
      }
    }

    return uploadGifs;
  }
}
