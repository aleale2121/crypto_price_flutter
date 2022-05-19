import 'package:flutter/material.dart';
import 'package:woo_flutter_test/shared/constants.dart';

class HeaderItem extends StatelessWidget {
  final String label;
  final AlignmentGeometry alignment;
  final String ascend;
  final bool isSortingField;
  final Function onTap;
  const HeaderItem({
    Key? key,
    required this.label,
    required this.alignment,
    required this.ascend,
    required this.isSortingField,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          height: 40,
          alignment: alignment,
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15,
              ),
              children: [
                TextSpan(
                  text: label,
                ),
                generateSortIcon(ascend, isSortingField),
              ],
            ),
          )),
    );
  }

  InlineSpan generateSortIcon(String ascend, bool isCurrentSortField) {
    if (ascend == descending && isCurrentSortField) {
      return const WidgetSpan(
        child: Icon(
          Icons.arrow_downward,
          size: 17,
        ),
      );
    } else if (ascend == ascending && isCurrentSortField) {
      return const WidgetSpan(
        child: Icon(
          Icons.arrow_upward,
          size: 17,
        ),
      );
    }
    return const WidgetSpan(
      child: SizedBox(
        width: 2,
      ),
    );
  }
}
