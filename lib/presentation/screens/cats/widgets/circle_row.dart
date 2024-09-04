import 'package:app_pragma_catbreeds/utils/utils.dart';
import 'package:flutter/material.dart';

class CircleRow extends StatefulWidget {
  final int value;

  const CircleRow({super.key, required this.value});

  @override
  State<CircleRow> createState() => _CircleRowState();
}

class _CircleRowState extends State<CircleRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Container(
          margin: const EdgeInsets.all(3.0),
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < widget.value
                ? UtilColors.colorPrincipal
                : UtilColors.colorSecundario,
          ),
        );
      }),
    );
  }
}
