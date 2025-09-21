import 'package:flutter/cupertino.dart';

import '../../common/common_path.dart';

class TableHelper {
  static TableRow buildRow({String? label, String? value, String? space}) {
    final isSpace = space ?? '\t\t';

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: AppDescription(title: label),
        ),
        AppDescription(title: '$isSpace:'),
        AppDescription(title: value ?? 'Unknown'),
      ],
    );
  }
}