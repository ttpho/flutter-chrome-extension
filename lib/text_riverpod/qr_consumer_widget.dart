import 'package:chrome_extension/text_riverpod/text_provider.dart';
import 'package:chrome_extension/text_riverpod/text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRConsumerWidget extends ConsumerWidget {
  const QRConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? text = ref.watch(textProvider);
    final String finalText = text ?? "";
    if (finalText.isEmpty) {
      return Container();
    }
    return QrImage(
      data: finalText,
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}

class TextInputConsumerWidget extends ConsumerWidget {
  const TextInputConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextState textState = ref.read(textProvider.notifier);
    return TextInputWidget(
      controller: TextEditingController(),
      onSubmitted: (final String value) {
        textState.setNewText(value);
      },
      onChanged: (final String value) {
        textState.setNewText(value);
      },
    );
  }
}

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  const TextInputWidget({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: 'Enter a URL',
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            onChanged?.call("");
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}
