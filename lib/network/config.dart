class Config {
  static final Env env = Env.Development;
  static final String urlAddress =
      "us-central1-stock-fantasy-fd46e.cloudfunctions.net";
  String get endPoint => env == Env.Development
      ? 'http://' + urlAddress
      : // development Url
      ""; //dev url // Production Url

  /// for wb endpoint
  String get wsPoint => env == Env.Development
      ? 'ws://' + urlAddress
      : // development Url
      ""; //dev url // Production Url

}

enum Env { Development, Staging, Production }
