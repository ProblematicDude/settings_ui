import 'package:flutter/material.dart';
import 'package:settings_ui/settings/AbstractSection.dart';
import 'package:settings_ui/settings/SettingsTiles.dart';

// ignore: must_be_immutable
class TilesSection extends AbstractSection {
  TilesSection({Key? key, this.tiles, title})
      : super(key: key, title: title, titlePadding: defaultTitlePadding);

  final List<SettingsTile>? tiles;

  @override
  @override
  Widget build(BuildContext context) {
    return androidSection(context);
  }

  Widget androidSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3,top: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Padding(
            padding: titlePadding!,
            child: Text(
              title!,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tiles!.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            return tiles![index];
          },
        ),
        if (showBottomDivider) const Divider(height: 1)
      ]),
    );
  }
}
