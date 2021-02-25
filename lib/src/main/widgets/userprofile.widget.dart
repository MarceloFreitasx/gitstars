import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:gitstars/core/styles/styles.dart';
import 'package:gitstars/src/main/models/userstars.model.dart';

class UserProfile extends StatelessWidget {
  final UserStarsModel user;
  final bool showBio;
  final Function onShowBio;

  const UserProfile({
    Key key,
    @required this.user,
    this.showBio = false,
    this.onShowBio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
              child: Hero(
                tag: user.avatarUrl,
                child: CircleAvatar(
                  radius: 50,
                  child: CachedNetworkImage(
                    imageUrl: user.avatarUrl,
                    imageBuilder: (_, imageProvider) => ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: AppStyles.subtitle1),
                  Text(user.email, style: AppStyles.caption1),
                  Container(height: 10),
                  Text(user.location, style: AppStyles.body4, maxLines: 2),
                  Text(user.url, style: AppStyles.caption1),
                ],
              ),
            ),
          ],
        ),
        InkWell(
          onTap: onShowBio,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bio", style: AppStyles.caption2),
              showBio ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        if (showBio)
          Html(
            data: user.bioHtml,
            style: {
              "div": Style.fromTextStyle(AppStyles.body3),
            },
          ),
      ],
    );
  }
}
