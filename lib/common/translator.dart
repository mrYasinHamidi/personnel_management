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
          'nameValidationError': 'Please enter your name',
          'emailValidationError': 'Please enter the email address correctly',
          'phoneValidationError': 'Incorrect mobile number',
          'passwordValidationError': 'Password should have at least 8 character',
          'passwordsNotMatch': 'Passwords not match',
          'usernameValidationError': 'Username is not valid you can only use numbers , characters , _ and . ',
          'email':'Email',
          'mobileNumber':'Mobile Number',
          'password':'Password',
          'passwordConfirmation':'Password Confirmation',
          'fullName':'Full Name'
        },
        'fa_FA': {
          'signup': 'ثبت نام',
          'login': 'ورود',
          'nameValidationError': 'لطفا نام خود را وارد کنید',
          'emailValidationError': 'لطفا آدرس ایمیل خود را به درستی وارد کنید',
          'phoneValidationError': 'شماره تلفن اشتباه است',
          'passwordValidationError': 'رمز عبور باید حداقل 8 حرف باشد',
          'passwordsNotMatch': 'تایید رمز عبور را اشتباه وارد کرده اید',
          'usernameValidationError': 'در نام کاربری خود تنها میتوانید از حروف و اعداد و خط تیره و نقطه استفاده کنید',
          'email':'ایمیل',
          'mobileNumber':'شماره تلفن',
          'password':'کلمه عبور',
          'passwordConfirmation':'تکرار کلمه عبور',
          'fullName':'نام و نام خوانوادگی',
        },
      };
}
