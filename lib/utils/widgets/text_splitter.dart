import 'package:flutter/material.dart';

// The class is for splitting string according to its boundary
class TextSplitter {
  final double maxWidth;
  final TextStyle textStyle;

  TextSplitter({required this.maxWidth, required this.textStyle});

  // This method split the string and give us List<String>
  List<String> splitText(String text) {
    List<String> lines = [];
    String remainingText = text;

    while (remainingText.isNotEmpty) {
      String nextLine = _getNextLine(remainingText);
      lines.add(nextLine.trimRight());

      // Remove the processed line from the remaining text
      remainingText = remainingText.substring(nextLine.length).trimLeft();
    }

    return lines;
  }

  String _getNextLine(String text) {
    TextSpan span = TextSpan(text: text, style: textStyle);
    TextPainter tp = TextPainter(text: span, maxLines: 1, textDirection: TextDirection.ltr);

    List<String> words = text.split(' ');  // Split by words
    String currentLine = '';

    for (String word in words) {
      String testLine = currentLine.isEmpty ? word : '$currentLine $word';

      tp.text = TextSpan(text: testLine, style: textStyle);
      tp.layout(maxWidth: maxWidth);

      if (tp.didExceedMaxLines) {
        break;  // Stop if adding the next word exceeds the max width
      } else {
        currentLine = testLine;
      }
    }

    return currentLine;
  }
}