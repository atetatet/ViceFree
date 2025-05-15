class ServerException400 implements Exception {
  final String? message;

  ServerException400({this.message});
}

class ServerException401 implements Exception {}

class ServerException406 implements Exception {}

class ServerException500 implements Exception {}

class GeneralException implements Exception {}

class CacheException implements Exception {}
