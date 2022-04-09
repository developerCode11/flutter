// ignore_for_file: constant_identifier_names

class ApiConstants {
  // static const baseURL = "https://api.jeevamhealth.com/"; // PRODUCATION
  static const baseURL = "https://api-dev.jeevamhealth.com/"; //STAGGING

  // static const streamChatKey = "cufatv7seswj"; //PRODUCTION
  static const streamChatKey = "n8nn3pw2995h"; //STAGGING

  static const String apiV1Url = baseURL + "api/v1/";
  //Authentication
  static const loginUrl = apiV1Url + "user/cos/login";
  static const profileUrl = apiV1Url + "profile/";
  static const fcmRegisterToken = apiV1Url + "fcm/registration";

  //Chat
  static const String getChatUserId = apiV1Url + "chat/user/";
}

class NotificationConsumerType {
  static const MESSAGING = 'messaging';
}
