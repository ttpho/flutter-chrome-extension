import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextState extends StateNotifier<String?> {
  TextState() : super("");

  void setNewText(final String? newText) {
    if (state == newText) return;
    state = newText;
  }
}
