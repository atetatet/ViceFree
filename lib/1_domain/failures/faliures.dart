// ignore_for_file: overridden_fields, annotate_overrides

abstract class Failure {
  final String? message;

  Failure({this.message});
}

class ServerFailure400 extends Failure {
  final String? message;

  ServerFailure400({this.message});
}

class ServerFailure401 extends Failure {}

class ServerFailure406 extends Failure {}

class ServerFailure500 extends Failure {}

class InvalidLogon extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}
