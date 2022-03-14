import 'package:flutter/widgets.dart';
import 'package:flutter_ui_toolkit/application/home/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier()
      : super(const HomeState(
            isDark: false,
            isFrameVisible: false,
            isKeyboard: false,
            isEnabled: true,
            orientation: Orientation.portrait));

  void toggleFrame() =>
      state = state.copyWith(isFrameVisible: !state.isFrameVisible);

  void toggleKeyboard() =>
      state = state.copyWith(isKeyboard: !state.isKeyboard);

  void toggleDarkNess() => state = state.copyWith(isDark: !state.isDark);
  void enableDisable() => state = state.copyWith(isEnabled: !state.isEnabled);
  void toggleOrientation() => state = state.copyWith(
      orientation: state.orientation == Orientation.landscape
          ? Orientation.portrait
          : Orientation.landscape);
}
