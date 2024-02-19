import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../../core/widgets/share/share_ayah_options.dart';
import '../../../../controllers/ayat_controller.dart';
import '../../../../controllers/general_controller.dart';
import '../../../../controllers/quran_controller.dart';
import '../buttons/add_bookmark_button.dart';
import '../buttons/copy_button.dart';
import '../buttons/play_button.dart';
import '../buttons/tafsir_button.dart';
import '/core/utils/constants/extensions.dart';

class AyahsMenu extends StatelessWidget {
  final int surahNum;
  final int ayahNum;
  final String ayahText;
  final int pageIndex;
  final String ayahTextNormal;
  final int ayahUQNum;
  final String surahName;
  final bool isSelected;

  AyahsMenu({
    super.key,
    required this.surahNum,
    required this.ayahNum,
    required this.ayahText,
    required this.pageIndex,
    required this.ayahTextNormal,
    required this.ayahUQNum,
    required this.surahName,
    required this.isSelected,
  });

  final generalCtrl = sl<GeneralController>();
  final quranCtrl = sl<QuranController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      decoration: BoxDecoration(
          color: isSelected
              ? Get.theme.colorScheme.surface.withOpacity(.4)
              : Get.theme.colorScheme.surface.withOpacity(.15),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/sora_num.svg',
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      generalCtrl.convertNumbers(ayahNum.toString()),
                      style: TextStyle(
                          color: Get.theme.hintColor,
                          fontFamily: "kufi",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Obx(() => AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TafsirButton(
                      surahNum: surahNum,
                      ayahNum: ayahNum,
                      ayahText: ayahText,
                      pageIndex: pageIndex,
                      ayahTextNormal: ayahTextNormal,
                      ayahUQNum: ayahUQNum,
                    ),
                    const Gap(6),
                    context.vDivider(height: 18.0),
                    PlayButton(
                      surahNum: surahNum,
                      ayahNum: ayahNum,
                      ayahUQNum: ayahUQNum,
                    ),
                    const Gap(6),
                    context.vDivider(height: 18.0),
                    GestureDetector(
                      onTap: () => quranCtrl.toggleMenu("$surahNum-$ayahNum"),
                      child: Icon(
                        Icons.more_vert_outlined,
                        size: 24,
                        color: Get.theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                secondChild: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TafsirButton(
                      surahNum: surahNum,
                      ayahNum: ayahNum,
                      ayahText: ayahText,
                      pageIndex: pageIndex,
                      ayahTextNormal: ayahTextNormal,
                      ayahUQNum: ayahUQNum,
                    ),
                    const Gap(6),
                    context.vDivider(height: 18.0),
                    PlayButton(
                      surahNum: surahNum,
                      ayahNum: ayahNum,
                      ayahUQNum: ayahUQNum,
                    ),
                    const Gap(4),
                    context.vDivider(height: 18.0),
                    const Gap(6),
                    AddBookmarkButton(
                      surahNum: surahNum,
                      ayahNum: ayahNum,
                      ayahUQNum: ayahUQNum,
                      pageIndex: pageIndex,
                      surahName: surahName,
                    ),
                    const Gap(6),
                    context.vDivider(height: 18.0),
                    const Gap(6),
                    CopyButton(
                      ayahNum: ayahNum,
                      ayahTextNormal: ayahTextNormal,
                    ),
                    const Gap(6),
                    context.vDivider(height: 18.0),
                    const Gap(6),
                    ShareAyahOptions(
                      verseNumber: ayahNum,
                      verseUQNumber: ayahUQNum,
                      surahNumber: surahNum,
                      ayahTextNormal: ayahTextNormal,
                      verseText: ayahTextNormal,
                      surahName: 'surahName',
                      textTranslate:
                          sl<AyatController>().currentText.value?.translate ??
                              '',
                    ),
                    const Gap(6),
                    context.vDivider(height: 18.0),
                    context.customClose(
                      height: 16.0,
                      close: () => quranCtrl.toggleMenu("$surahNum-$ayahNum"),
                    ),
                  ],
                ),
                crossFadeState:
                    quranCtrl.moreOptionsMap["$surahNum-$ayahNum"] == true
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
              )),
        ],
      ),
    );
  }
}