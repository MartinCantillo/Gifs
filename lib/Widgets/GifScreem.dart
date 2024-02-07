import 'package:flutter/material.dart';
import 'package:gif/Models/Gifts.dart';
import 'package:gif/Provider/GifService.dart';

class GifScreem extends StatefulWidget {
  const GifScreem({super.key});

  @override
  State<GifScreem> createState() => _GifScreemState();
}

class _GifScreemState extends State<GifScreem> {
  GiftServic giftServic = GiftServic();
  late Future< List<Gifs>> gifsList;
  @override
  void initState() {
    super.initState();
    gifsList = giftServic.fecthGifs() ;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
          backgroundColor: Colors.black,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),
        ),
      ),
    );
  }
}
