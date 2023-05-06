import 'package:flutter/material.dart';

import '../models/DataList.dart';

class DataPopUp extends StatelessWidget {
  const DataPopUp(this.popup);

  final DataList popup;

  @override
  Widget build(BuildContext context) {
    Widget _buildTiles(DataList root) {
      if (root.children.isEmpty)
        return ListTile(
          title: root.title ?? SizedBox(),
          leading: root.icon != null ? root.icon : SizedBox(),
          onTap: () {
            if (root.nextScreen != null) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => root.nextScreen!));
            }
          },
        );

      return ExpansionTile(
        key: PageStorageKey<DataList>(root),
        title: root.title!,
        leading: root.icon != null ? root.icon : SizedBox(),
        children: root.children.map(_buildTiles).toList(),
      );
    }

    return _buildTiles(popup);
  }
}
