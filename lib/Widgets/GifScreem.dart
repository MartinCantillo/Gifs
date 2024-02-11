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
          title: const Text(
            "Gifs",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Text('Drawer Header',
                      style: TextStyle(color: Colors.white))),
            ],
          ),
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
            } else if (gifsList == null) {
              return Center(child: Text('El snapshot es nulo'));
            } else {
              return GridView.count(
                crossAxisSpacing: 1,
                mainAxisSpacing: 2,
                crossAxisCount: 2,
                children: Upload(snapshot.data),
              );
            }
          },
        ),
      ),
    );
  }

  //Construyo los widgets
  List<Widget> Upload(gifs) {
    List<Widget> uploadGifs = [];

    // Verifico si gifs no es nulo
    if (gifs != null) {
      // Itero sobre la lista de Gifs
      for (var element in gifs) {
        // Itero sobre la lista de Datum dentro de cada Gifs
        //uploadGifs.add(Column(children: [Image.network(element.url,fit: BoxFit.fill,)],));
        uploadGifs.add(Card(
          child: Column(children: [
            Expanded(
                child: Image.network(
              element.url,
              fit: BoxFit.fill,
            ))
          ]),
        ));
      }
    }

    return uploadGifs;
  }
}
