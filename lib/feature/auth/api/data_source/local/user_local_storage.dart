abstract interface class UserLocalStorage{
  Future<void>init();
  Future<void>saveToken(String token);
  Future<String?>getToken();
  Future<void>deleteToken();
}