import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SettingsButtonsEnum {
  accountInfo,
  language,
  theme,
  faqs,
  sendFeedback,
  logout,
}

extension SettingsButtonsEnumExtension on SettingsButtonsEnum {
  String get title {
    switch (this) {
      case SettingsButtonsEnum.accountInfo:
        return 'Account Info';
      case SettingsButtonsEnum.language:
        return 'Language';
      case SettingsButtonsEnum.theme:
        return 'Theme';
      case SettingsButtonsEnum.faqs:
        return 'FAQs';
      case SettingsButtonsEnum.sendFeedback:
        return 'Send Feedback';
      case SettingsButtonsEnum.logout:
        return 'Logout';
    }
  }

  IconData get icon {
    switch (this) {
      case SettingsButtonsEnum.accountInfo:
        return Icons.person;
      case SettingsButtonsEnum.language:
        return FontAwesomeIcons.globe;
      case SettingsButtonsEnum.theme:
        return Icons.dark_mode;
      case SettingsButtonsEnum.faqs:
        return Icons.info;
      case SettingsButtonsEnum.sendFeedback:
        return Icons.send;
      case SettingsButtonsEnum.logout:
        return Icons.logout;
    }
  }

  Color get iconColor {
    switch (this) {
      case SettingsButtonsEnum.accountInfo:
        return Colors.purple;
      case SettingsButtonsEnum.language:
        return Colors.orange;
      case SettingsButtonsEnum.theme:
        return Colors.blue;
      case SettingsButtonsEnum.faqs:
        return Colors.grey;
      case SettingsButtonsEnum.sendFeedback:
        return Colors.green;
      case SettingsButtonsEnum.logout:
        return Colors.red;
    }
  }

  void execute(BuildContext context) {
    switch (this) {
      case SettingsButtonsEnum.accountInfo:
        log('Account Info');
        break;
      case SettingsButtonsEnum.language:
        log('Language');
        break;
      case SettingsButtonsEnum.theme:
        log('Theme');
        break;
      case SettingsButtonsEnum.faqs:
        log('FAQs');
        break;
      case SettingsButtonsEnum.sendFeedback:
        log('Send Feedback');
        break;
      case SettingsButtonsEnum.logout:
        log('Logout');
        break;
    }
  }
}
