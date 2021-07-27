import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grideview/Dynamic.dart';
import 'package:grideview/sliver.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    title: 'Wallpaper',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Wallpaper'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 5.0,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.dynamic_feed),
                text: 'Dynamic',
              ),
              Tab(
                icon: Icon(Icons.stacked_line_chart_sharp),
                text: 'Sliver',
              ),
            ],
          ),
        ),
        body: Delay(),
      ),
    );
  }
}

class Delay extends StatefulWidget {
  @override
  _DelayState createState() => _DelayState();
}

class _DelayState extends State<Delay> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 8), () {
      setState(() {
        isLoading = false;
      });
    });

    return isLoading ? ShimmerEffect() : WallpaperList();
  }
}

class WallpaperList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        WallpaperPage(),
        dynamicTab(),
        sliverTab(),
      ],
    );
  }
}

class WallpaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: BouncingScrollPhysics(),
      staggeredTileBuilder: (index) {
        return index % 7 == 0
            ? StaggeredTile.count(2, 2)
            : StaggeredTile.count(1, 1);
        // StaggeredTile.count(2, index.isEven ? 2 : 1);
      },
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 3,
      itemCount: 25,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShimmerEffect extends StatefulWidget {
  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900],
      highlightColor: Colors.grey[850],
      child: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        staggeredTileBuilder: (index) {
          return index % 7 == 0
              ? StaggeredTile.count(2, 2)
              : StaggeredTile.count(1, 1);
          // StaggeredTile.count(2, index.isEven ? 2 : 1);
        },
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        crossAxisCount: 3,
        itemCount: 25,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: null,
              ),
            ),
          );
        },
      ),
    );
  }
}
