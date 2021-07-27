import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget sliverTab() {
  return StaggeredGridView.extentBuilder(
    physics: BouncingScrollPhysics(),
    staggeredTileBuilder: (index) {
      return StaggeredTile.extent(1, 250);
    },
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    maxCrossAxisExtent: 150,
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
              'https://source.unsplash.com/random?sig=$index+2',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
  );
}
