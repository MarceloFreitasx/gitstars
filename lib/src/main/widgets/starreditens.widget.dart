import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gitstars/core/styles/styles.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';

class StarredItens extends StatelessWidget {
  final Node node;
  const StarredItens({
    Key key,
    @required this.node,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(node.name, style: AppStyles.body4),
            Container(height: 5),
            Text(node.description, style: AppStyles.caption1),
            Container(height: 5),
            Row(
              children: [
                SvgPicture.asset(AppAssets.STAR, width: 12, height: 12),
                Container(width: 5),
                Text("${node.stargazerCount}"),
                Container(width: 20),
                SvgPicture.asset(AppAssets.STAR, width: 12, height: 12),
                Container(width: 5),
                Text("${node.forkCount}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
