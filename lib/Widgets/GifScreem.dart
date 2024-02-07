import 'package:flutter/material.dart';

class GifScreem extends StatefulWidget {
  const GifScreem({super.key});

  @override
  State<GifScreem> createState() => _GifScreemState();
}

class _GifScreemState extends State<GifScreem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        backgroundColor: Colors.black,
        
      ),
     body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
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
