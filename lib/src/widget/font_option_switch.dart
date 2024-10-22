import 'package:flutter/material.dart';
import 'package:text_editor/src/font_option_model.dart';
import 'package:text_editor/text_editor_data.dart';

class ColorOption extends StatelessWidget {
  final Widget? colorPaletteSwitch;

  const ColorOption({super.key, this.colorPaletteSwitch});

  @override
  Widget build(BuildContext context) {
    final model = TextEditorData.of(context).fontOptionModel;
    return GestureDetector(
      onTap: () {
        if (model.status == FontOptionStatus.colorPalette) return;
        model.changeFontOptionStatus(model.status);
      },
      child: colorPaletteSwitch ??
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5),
              border: Border.all(color: Colors.white, width: 1.5),
              gradient: SweepGradient(
                colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.blue,
                ],
                stops: [0.0, 0.25, 0.5, 0.75, 1],
              ),
            ),
          ),
    );
  }
}

class FontOption extends StatelessWidget {
  final Widget? fontFamilySwitch;

  const FontOption({super.key, this.fontFamilySwitch});

  @override
  Widget build(BuildContext context) {
    final model = TextEditorData.of(context).fontOptionModel;
    return GestureDetector(
      onTap: () {
        if (model.status == FontOptionStatus.fontFamily) return;
        model.changeFontOptionStatus(model.status);
      },
      child: fontFamilySwitch ??
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Center(
              child: Text(
                'Aa',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
    );
  }
}
