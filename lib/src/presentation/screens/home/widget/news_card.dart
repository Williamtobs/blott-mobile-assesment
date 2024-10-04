import 'package:auto_route/auto_route.dart';
import 'package:blott_mobile_assesment/src/core/constants/app_spacing.dart';
import 'package:blott_mobile_assesment/src/core/constants/styles.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:blott_mobile_assesment/src/core/router/app_router.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.author,
    required this.date,
    required this.image,
    required this.description,
    required this.url,
  });

  final String author;
  final String date;
  final String image;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.router.push(WebViewRoute(url: url));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.height),
        child: Row(
          children: [
            SizedBox(
              width: 100.width,
              height: 100.height,
              child: Image.network(
                image,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        author,
                        style: Styles.rubikText(
                          color: const Color(0xFFFFFFFF).withOpacity(0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: Styles.rubikText(
                          color: const Color(0xFFFFFFFF).withOpacity(0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    // softWrap: true,
                    style: Styles.rubikText(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
