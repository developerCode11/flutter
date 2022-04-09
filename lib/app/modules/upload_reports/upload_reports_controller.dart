import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UploadReportsController extends GetxController {
  RxList<File> images = <File>[].obs;
  RxBool isShowDoneLoader = false.obs;
   DateTime date = DateTime.now();
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController dateTextEditingController =
      TextEditingController();
}
