class RemoteUrls {
  static const String baseUrl = "http://api.nytimes.com/";

  static String getMostPopularAPI(String section, String period) =>
      '${baseUrl}svc/mostpopular/v2/mostviewed/$section/$period.json?api-key=fgnOCr1KByNkHwShIXLJFw1eOxDtWBCU';
}
