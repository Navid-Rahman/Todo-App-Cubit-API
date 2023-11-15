import 'package:flutter/material.dart';

AppBar kAppBarStyle = AppBar(
  leading: const Icon(
    Icons.menu,
    color: Colors.black,
  ),
  centerTitle: true,
  title: const Text(
    'Todo',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: const Color(0XFFEBE3D5),
);

const kTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Color(0XFF22092C),
);

const kSubtitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
);
