import 'package:flutter/material.dart';
import 'package:gif/Models/Gifts.dart';
import 'package:gif/Provider/GifService.dart';

class GifScreem extends StatefulWidget {
  const GifScreem({Key? key});

  @override
  State<GifScreem> createState() => _GifScreemState();
}

class _GifScreemState extends State<GifScreem> {
  late Future<List<Datum>> gifsList;
  late ScrollController _scrollController;
  List<Datum> _gifs = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    gifsList = GiftServic.fecthGifs();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Si no está cargando más datos actualmente, cargar más
      if (!_isLoading) {
        _loadMoreGifs();
      }
    }
  }

  Future<void> _loadMoreGifs() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final additionalGifs = await GiftServic.fecthGifs();
      setState(() {
        _gifs.addAll(additionalGifs);
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading more gifs: $e');
      setState(() {
        _isLoading = false;
      });
    }
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              _gifs = snapshot.data as List<Datum>;
              return GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 2,
                  crossAxisCount: 2,
                ),
                itemCount: _gifs.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < _gifs.length) {
                    return Card(
                      child: Image.network(
                        _gifs[index].url,
                        fit: BoxFit.fill,
                      ),
                    );
                  } else {
                    return _isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
