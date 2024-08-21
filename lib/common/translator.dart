import 'dart:ui';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Translator extends Translations {
  static final defaultLocal = Get.deviceLocale;
  static const fa = Locale('fa', 'FA');
  static const en = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'signup': 'Signup',
          'login': 'Login',
          'emailValidationError': 'Please enter the email address correctly',
          'passwordValidationError': 'Password should have at least 8 character',
          'passwordsNotMatch': 'Passwords not match',
          'usernameValidationError': 'Username is not valid you can only use numbers , characters , _ and . ',
        },
        'fa_FA': {
          'signup': 'ثبت نام',
          'login': 'ورود',
          'emailValidationError': 'لطفا آدرس ایمیل خود را به درستی وارد کنید',
          'passwordValidationError': 'رمز عبور باید حداقل 8 حرف باشد',
          'passwordsNotMatch': 'تایید رمز عبور را اشتباه وارد کرده اید',
          'usernameValidationError': 'در نام کاربری خود تنها میتوانید از حروف و اعداد و خط تیره و نقطه استفاده کنید',
        },
      };
}
