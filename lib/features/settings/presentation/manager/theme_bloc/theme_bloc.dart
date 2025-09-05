import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc._internal(super.initialTheme) {
    on<ThemeChanged>(_onThemeChanged);
  }

  // Factory constructor that loads theme before creating bloc
  static Future<ThemeBloc> create() async {
    final initialTheme = await _loadThemeStatic();
    return ThemeBloc._internal(initialTheme ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<ThemeMode> emit,
  ) async {
    final newTheme = event.isDark ? ThemeMode.dark : ThemeMode.light;
    emit(newTheme);
    await _saveTheme(event.isDark);
  }

  Future<void> _saveTheme(bool isDark) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', isDark);
    } catch (e) {
      debugPrint('Failed to save theme: $e');
    }
  }

  // Static method for initial load
  static Future<bool> _loadThemeStatic() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isDarkMode') ?? false;
    } catch (e) {
      debugPrint('Failed to load theme: $e');
      return false;
    }
  }
}
