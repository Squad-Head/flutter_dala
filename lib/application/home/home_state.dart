import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  final bool isDark;
  final bool isFrameVisible;
  final bool isKeyboard;
  final bool isEnabled;
  final Orientation orientation;
  const HomeState({
    required this.isDark,
    required this.isFrameVisible,
    required this.isKeyboard,
    required this.isEnabled,
    required this.orientation,
  });

  HomeState copyWith({
    bool? isDark,
    bool? isFrameVisible,
    bool? isKeyboard,
    bool? isEnabled,
    Orientation? orientation,
  }) {
    return HomeState(
      isDark: isDark ?? this.isDark,
      isFrameVisible: isFrameVisible ?? this.isFrameVisible,
      isKeyboard: isKeyboard ?? this.isKeyboard,
      isEnabled: isEnabled ?? this.isEnabled,
      orientation: orientation ?? this.orientation,
    );
  }

  @override
  List<Object> get props {
    return [
      isDark,
      isFrameVisible,
      isKeyboard,
      isEnabled,
      orientation,
    ];
  }

  @override
  String toString() {
    return 'HomeState(isDark: $isDark, isFrameVisible: $isFrameVisible, isKeyboard: $isKeyboard, isEnabled: $isEnabled, orientation: $orientation)';
  }
}
