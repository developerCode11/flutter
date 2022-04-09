import 'dart:ui';
import 'package:flutter/material.dart';

class CustomBlur extends StatelessWidget {
  CustomBlur({Key? key, this.child, this.height}) : super(key: key);
  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
      child: Stack(
        children: <Widget>[
          // ConstrainedBox(
          //     constraints: const BoxConstraints.expand(),
          //     child:  Column(
          //       children: List.generate(10, (index) => doubleLineShimmer( getColor(index),context)),
          //     ),
          // ),
          Container(
            height: height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            constraints: height == null ? const BoxConstraints.expand() : null,
            child: ListView(
              children: List.generate(
                  10, (index) => doubleLineShimmer(getColor(index), context)),
            ),
          ),
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20.0)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                  height: height,
                  constraints:
                      height == null ? const BoxConstraints.expand() : null,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20.0)),
                      color: Colors.grey.shade100.withOpacity(0.1)),
                  child: child),
            ),
          ),
        ],
      ),
    );
  }

  Widget doubleLineShimmer(String? hexColor, context) {
    return Container(
      decoration: BoxDecoration(
          color: fromHex(hexColor!).withOpacity(0.09),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: fromHex(hexColor).withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
            ),
          ],
        ),
      ),
    );
  }

  getColor(index) {
    if ((index % 8) == 0) {
      return "#03A9F4";
    }
    if ((index % 8) == 1) {
      return "#00BCD4";
    }
    if ((index % 8) == 2) {
      return "#009688";
    }
    if ((index % 8) == 3) {
      return "#4CAF50";
    }
    if ((index % 8) == 4) {
      return "#8BC34A";
    }
    if ((index % 8) == 5) {
      return "#FF9800";
    }
    if ((index % 8) == 6) {
      return "#FF5722";
    }
    if ((index % 8) == 7) {
      return "#673AB7";
    }
  }
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
