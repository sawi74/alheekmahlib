import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../quran_page/data/model/aya.dart';
import '../../quran_page/data/repository/aya_repository.dart';

part 'aya_state.dart';

class AyaCubit extends Cubit<AyaState> {
  final AyaRepository _ayaRepository = AyaRepository();

  AyaCubit() : super(AyaLoading());

  void getAllAyas() {
    emit(AyaLoading());
    _ayaRepository.all().then((ayahList) {
      emit(AyaLoaded(ayahList));
    }).catchError((e) {
      emit(AyaError("Error fetching Ayas: $e"));
    });
  }

  String _convertArabicToEnglishNumbers(String input) {
    final arabicNumbers = '٠١٢٣٤٥٦٧٨٩';
    final englishNumbers = '0123456789';

    return input.split('').map((char) {
      int index = arabicNumbers.indexOf(char);
      if (index != -1) {
        return englishNumbers[index];
      }
      return char;
    }).join('');
  }

  void search(String text) async {
    // Convert Arabic numerals to English numerals if any
    String convertedText = _convertArabicToEnglishNumbers(text);

    emit(AyaLoading());

    try {
      final List<Aya>? values = await _ayaRepository.search(convertedText);
      if (values != null && values.isNotEmpty) {
        emit(AyaLoaded(values));
      } else {
        emit(AyaError("No results found for $convertedText"));
      }
    } catch (e) {
      emit(AyaError(e.toString()));
    }
  }
}
