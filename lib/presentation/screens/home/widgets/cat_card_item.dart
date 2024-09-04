import 'package:app_pragma_catbreeds/models/cats.dart';
import 'package:app_pragma_catbreeds/presentation/screens/cats/cat_details.dart';
import 'package:app_pragma_catbreeds/utils/util_colors.dart';
import 'package:app_pragma_catbreeds/utils/util_styles_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CatCardItem extends StatefulWidget {
  final CatModel catModel;

  const CatCardItem({super.key, required this.catModel});

  @override
  State<CatCardItem> createState() => _CatCardItemState();
}

class _CatCardItemState extends State<CatCardItem> {
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        'https://cdn2.thecatapi.com/images/${widget.catModel.referenceImageId}.jpg';

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => CatDetails(
                      imageUrl: imageUrl,
                      catModel: widget.catModel,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: UtilColors.colorSecundario)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.catModel.name ?? '',
                  style: UtilStylesText.bodySubTitle,
                ),
                const Spacer(),
                Text(
                  'Más ...',
                  style: UtilStylesText.bodySubTitle,
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 300,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: UtilColors.colorPrincipal,
                )),
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage('images/cat_not_found.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  widget.catModel.origin ?? '',
                  style: UtilStylesText.bodySubTitle,
                ),
                const Spacer(),
                Text(
                  widget.catModel.temperament!.split(',').first.trim(),
                  style: UtilStylesText.bodySubTitle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
