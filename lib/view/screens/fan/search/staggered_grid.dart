import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../main.dart';

class StaggeredGridExample extends StatelessWidget {
  final List<String> imageUrls = [
    dummyImage,
    dummyImage1,
    dummyImage2,
    dummyImage,
    dummyImage1,
    dummyImage2,
    dummyImage,
    dummyImage1,
    dummyImage2,
    dummyImage,
    dummyImage1,
    dummyImage2,
  ];

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4, // total columns
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 2, // width in columns
          mainAxisCellCount: 1, // height in rows
          child: _buildImage(imageUrls[0]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[1]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[2]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[3]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[4]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[1]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[2]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[3]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[4]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[5]),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: _buildImage(imageUrls[4]),
        ),
      ],
    );
  }

  Widget _buildImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}
