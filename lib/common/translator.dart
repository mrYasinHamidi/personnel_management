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
          'startDateValidationError': 'Please enter a valid date , this date should not be in past',
          'endDateValidationError': 'Please enter a valid date , work end date should be after work start date',
          'email': 'Email',
          'mobileNumber': 'Mobile Number',
          'password': 'Password',
          'passwordConfirmation': 'Password Confirmation',
          'fullName': 'Full Name',
          'errorMessage': 'Something went wrong please try again later',
          'itsDone': ' Its Done',
          'operationDoneSuccessfully': 'Operation done successfully',
          'workStartTime': 'Work Start Time',
          'startTimeValidationError': 'Please enter the start time',
          'workEndTime': 'Work End Time',
          'endTimeValidationError': 'Work end time should be after start time',
          'workStartDateNotRequired': 'If you did not select this field , time of now will be set',
          'floatTimeNotInfo': 'Time that personnel can be late after start date',

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
          'startDateValidationError': 'لطفا تاریخ شروع به کار را به درستی وارد کنید . نباید در گذشته باشد',
          'endDateValidationError': 'لطفا تاریخ پایان کار را به درستی وارد کنید(باید بعد از تاریخ شروع به کار باشد)',
          'email': 'ایمیل',
          'mobileNumber': 'شماره تلفن',
          'password': 'کلمه عبور',
          'passwordConfirmation': 'تکرار کلمه عبور',
          'fullName': 'نام و نام خوانوادگی',
          'errorMessage': 'متاسفانه مشکلی پیش آمده.لطفا لحضاتی دیگر محدد تلاش کنید',
          'itsDone': ' انجام شد',
          'operationDoneSuccessfully': 'عملیات با موفقیت انجام شد',
          'workStartTime': 'ساعت شروع به کار',
          'startTimeValidationError': 'لطفا ساعت شروع به کار را وارد کنید',
          'workEndTime': 'ساعت پایان کار',
          'endTimeValidationError': 'لطفا ساعت پایان کار را وارد کنید.نباید قبل از ساعت شروع به کار باشد',
          'workStartDateNotRequired': 'در صورت مشخص نکردن این فیلد از همین اکنون را در نظر خواهیم گرفت',
          'floatTimeNotInfo': 'ساعت شناوری و ساعتی است که پرسنل اجازه تاخیر از ساعت شروع به کار را دارد.شما می توانید این فیلد را خالی بگزارید',
        },
      };
}
