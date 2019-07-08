/**
 * textStyle 정보 담긴 file
 *
 * @author 서윤경
 * @version 1.0, textStyle file
 * @date 2019.07.03
 */

import 'package:flutter/material.dart';

abstract class textStyle {
  static const headLineText = TextStyle(
      fontWeight: FontWeight.w800, fontSize: 30, fontStyle: FontStyle.italic);
  static const subHeadLineText = TextStyle(
      fontWeight: FontWeight.w800, fontSize: 20, fontStyle: FontStyle.italic);
}
