import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedImagesNotifier extends StateNotifier<List<String>> {
  SelectedImagesNotifier() : super([]);

  void clearImages() {
    state = [];
  }

  void addImages(List<String> images) {
    state = [...state, ...images];
  }

  void removeImage(String imagePath) {
    state = state.where((image) => image != imagePath).toList();
  }
}

final selectedImagesProvider = StateNotifierProvider<SelectedImagesNotifier, List<String>>(
  (ref) => SelectedImagesNotifier(),
);