import 'package:flutter/material.dart';
import 'package:text_editor/text_editor_data.dart';

class ColorPalette extends StatefulWidget {
  final List<Color> colors;

  ColorPalette(this.colors);

  @override
  _ColorPaletteState createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  @override
  Widget build(BuildContext context) {
    final textStyleModel = TextEditorData.of(context).textStyleModel;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 32,
              height: 44,
              padding: EdgeInsets.symmetric(vertical: 4),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: textStyleModel.textStyle?.color,
                border: Border.all(color: Colors.white, width: 1.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.colorize,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            ...widget.colors
                .map(
                  (color) => _ColorPicker(
                    color,
                    color == textStyleModel.textStyle?.color,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  final Color color;
  final bool isSelected;

  _ColorPicker(this.color, this.isSelected);

  @override
  Widget build(BuildContext context) {
    final textStyleModel = TextEditorData.read(context).textStyleModel;

    return GestureDetector(
      onTap: () => textStyleModel.editTextColor(color),
      child: Container(
        width: 32,
        height: 44,
        margin: EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Color(0xffE5F2FF),
            width: isSelected ? 4 : 2,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
