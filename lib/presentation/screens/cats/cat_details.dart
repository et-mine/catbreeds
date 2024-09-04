import 'package:app_pragma_catbreeds/models/cats.dart';
import 'package:app_pragma_catbreeds/presentation/screens/cats/cat_characteristics.dart';
import 'package:app_pragma_catbreeds/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class CatDetails extends StatefulWidget {
  final String imageUrl;
  final CatModel catModel;

  const CatDetails({super.key, required this.imageUrl, required this.catModel});

  @override
  State<CatDetails> createState() => _CatDetailsState();
}

class _CatDetailsState extends State<CatDetails> {
  Future<void> launchURLString(String url) async {
    Uri uri = Uri.parse(url);
    if (await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) {
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } else {
      throw 'No se pudo abrir la URL $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: UtilColors.colorPrincipal,
          centerTitle: true,
          title: Text(
            widget.catModel.name ?? '',
            style: UtilStylesText.appBarTitle,
          )),
      body: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .45,
          child: CachedNetworkImage(
            imageUrl: widget.imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            )),
            errorWidget: (context, url, error) => const Image(
              image: AssetImage('images/cat_not_found.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .42,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 8.0,
              radius: const Radius.circular(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (widget.catModel.altNames!.isNotEmpty)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Alternative name : ',
                                    style: UtilStylesText.bodyTitle,
                                  ),
                                  Text(
                                    widget.catModel.altNames ??
                                        'Sin información',
                                    style: UtilStylesText.bodySubTitle,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lifespan : ',
                                  style: UtilStylesText.bodyTitle,
                                ),
                                Text(
                                  '${widget.catModel.lifeSpan} years',
                                  style: UtilStylesText.bodySubTitle,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Temperament : ',
                        style: UtilStylesText.bodyTitle,
                      ),
                      Text(
                        widget.catModel.temperament ?? 'Sin información',
                        style: UtilStylesText.bodySubTitle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Description : ',
                        style: UtilStylesText.bodyTitle,
                      ),
                      Text(
                        widget.catModel.description ?? 'Sin información',
                        style: UtilStylesText.bodySubTitle,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Breed Characteristics : ',
                        style: UtilStylesText.bodyTitle,
                      ),
                      CatCharacteristics(catModel: widget.catModel),
                      const SizedBox(
                        height: 20,
                      ),
                      if (widget.catModel.wikipediaUrl!.isNotEmpty)
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () async {
                                await launchURLString(
                                    widget.catModel.wikipediaUrl ?? '');
                              },
                              child: Text(
                                'Ver en Wikipedia',
                                style: UtilStylesText.bodyTitleLink,
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
