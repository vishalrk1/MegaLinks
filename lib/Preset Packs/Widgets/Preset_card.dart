import 'package:flutter/material.dart';
import 'package:onikiri_ui/Preset%20Packs/Selected_PresetPack_Screen.dart';
import 'package:onikiri_ui/models/PresetPack_Model.dart';

class PreSetCard extends StatelessWidget {
  final PresetPackModel preset;

  PreSetCard({this.preset});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ListTile(
            title: Text(preset.packName),
            subtitle: Text(preset.software),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(SelectedPresetPackScreen.routName, arguments: preset);
      },
    );
  }
}
