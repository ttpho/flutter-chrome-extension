import 'package:chrome_extension/text_riverpod/text_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textProvider = StateNotifierProvider<TextState, String?>((ref) {
  return TextState();
});
