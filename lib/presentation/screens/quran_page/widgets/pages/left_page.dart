import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftPage extends StatelessWidget {
  final Widget child;
  const LeftPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1280,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Get.theme.primaryColorDark.withOpacity(.5)
                      : Get.theme.dividerColor.withOpacity(.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              // child: child,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Get.theme.primaryColorDark.withOpacity(.7)
                      : Get.theme.dividerColor.withOpacity(.7),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              // child: child,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 16.0, bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}