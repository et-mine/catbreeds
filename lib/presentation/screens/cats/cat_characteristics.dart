import 'package:app_pragma_catbreeds/models/cats.dart';
import 'package:app_pragma_catbreeds/presentation/screens/cats/widgets/circle_row.dart';
import 'package:app_pragma_catbreeds/utils/util_styles_text.dart';
import 'package:flutter/material.dart';

class CatCharacteristics extends StatefulWidget {
  final CatModel catModel;

  const CatCharacteristics({super.key, required this.catModel});

  @override
  State<CatCharacteristics> createState() => _CatCharacteristicsState();
}

class _CatCharacteristicsState extends State<CatCharacteristics> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Adaptability',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.adaptability ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Affection level',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.affectionLevel ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Child friendly',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.childFriendly ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Dog friendly',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.dogFriendly ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Energy level',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.energyLevel ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Grooming',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.grooming ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Health issues',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.healthIssues ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Intelligence',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.intelligence ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Shedding level',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.sheddingLevel ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Social needs',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.socialNeeds ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Stranger friendly',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.strangerFriendly ?? 0)
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                'Vocalisation',
                style: UtilStylesText.bodySubTitle,
              ),
            ),
            CircleRow(value: widget.catModel.vocalisation ?? 0)
          ],
        ),
      ],
    );
  }
}
