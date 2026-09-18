abstract class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1';

  //auth
  static const String login = '$baseUrl/auth/signin';
  static const String signUp = '$baseUrl/auth/signup';
  static const String forgetPassword = '$baseUrl//auth/forgotPasswords';
  static const String verifyResetCode = '$baseUrl/auth/verifyResetCode';
  static const String updatePassword = '$baseUrl/users/changeMyPassword';
  static const String resetPassword = '$baseUrl/auth/resetPassword';
  static const String logout = '$baseUrl/auth/logout';
  static const String updateUserData = '$baseUrl/users/updateMe/';
}
