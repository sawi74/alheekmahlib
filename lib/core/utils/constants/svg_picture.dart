import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../presentation/controllers/bookmarks_controller.dart';
import '../../../presentation/controllers/general_controller.dart';
import '../../../presentation/controllers/surah_audio_controller.dart';
import '../../services/services_locator.dart';

Widget besmAllah(BuildContext context) {
  return SvgPicture.asset(
    'assets/svg/besmAllah.svg',
    width: 250,
    colorFilter:
        ColorFilter.mode(Get.theme.cardColor.withOpacity(.8), BlendMode.srcIn),
  );
}

Widget besmAllah2(BuildContext context) {
  return SvgPicture.asset(
    'assets/svg/besmAllah2.svg',
    width: 250,
    colorFilter:
        ColorFilter.mode(Get.theme.cardColor.withOpacity(.8), BlendMode.srcIn),
  );
}

Widget spaceLine(double height, width) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: SvgPicture.asset(
      'assets/svg/space_line.svg',
      height: height,
      width: width,
    ),
  );
}

Widget quranIcon(BuildContext context, double height, width) {
  return SvgPicture.asset(
    'assets/svg/quran_au_ic.svg',
    colorFilter:
        ColorFilter.mode(Get.theme.colorScheme.surface, BlendMode.srcIn),
    width: width,
    height: height,
  );
}

Widget bookmarkIcon(BuildContext context, double height, double width,
    {int? pageNum}) {
  return Obx(() {
    return Semantics(
      button: true,
      enabled: true,
      label: 'Add Bookmark',
      child: SvgPicture.asset(
        'assets/svg/bookmark_ic.svg',
        width: width,
        height: height,
        colorFilter: sl<BookmarksController>().isPageBookmarked(
                pageNum ?? sl<GeneralController>().currentPage.value)
            ? null
            : ColorFilter.mode(Get.theme.colorScheme.surface, BlendMode.srcIn),
      ),
    );
  });
}

Widget surahName(BuildContext context, double height, double width) {
  return SvgPicture.asset(
    'assets/svg/surah_name/00${sl<SurahAudioController>().surahNum}.svg',
    colorFilter:
        ColorFilter.mode(Get.theme.colorScheme.surface, BlendMode.srcIn),
    width: width,
    height: height,
  );
}

Widget decorations(BuildContext context, {double? height, double? width}) {
  return Opacity(
    opacity: .6,
    child: SvgPicture.asset(
      'assets/svg/decorations.svg',
      width: width,
      height: height ?? 60,
    ),
  );
}

Widget button_curve({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/button_curve.svg',
    width: width,
    height: height ?? 60,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.primary, BlendMode.srcIn),
  );
}

Widget options({double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    'assets/svg/options.svg',
    width: width,
    height: height ?? 60,
    colorFilter: ColorFilter.mode(
        color ?? Get.theme.colorScheme.background, BlendMode.srcIn),
  );
}
