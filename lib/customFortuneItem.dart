import 'package:flutter/material.dart';

Container customFortuneItem(it) {
  return Container(
    color: it['color'] as Color,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        it['image'] as Icon,
        Text(it['title'] as String),
      ],
    ),
  );
}
