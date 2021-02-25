import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gitstars/core/styles/styles.dart';
import 'package:gitstars/core/utils/extensions.util.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';

class StarredItens extends StatelessWidget {
  final Node node;
  final Function onClick;

  const StarredItens({
    Key key,
    @required this.node,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${node.name}", style: AppStyles.body4),
              Container(height: 10),
              Text("${node.description}", style: AppStyles.caption1),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (node.primaryLanguage != null)
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: HexColor.fromHex(node.primaryLanguage.color),
                        ),
                        Container(width: 5),
                        Text("${node.primaryLanguage.name}", style: AppStyles.caption1),
                      ],
                    ),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.STAR2, width: 12, height: 12),
                      Container(width: 5),
                      Text("${node.stargazerCount}", style: AppStyles.caption1),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.FORK, width: 12, height: 12),
                      Container(width: 5),
                      Text("${node.forkCount}", style: AppStyles.caption1),
                    ],
                  ),
                  Text("Updated ${node.pushedAt.onlyDate}", style: AppStyles.caption1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
