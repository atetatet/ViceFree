import 'package:vicefree/1_domain/failures/faliures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case const (ServerFailure500):
      return 'Internal server error. Please try again';
    case const (ServerFailure401):
      return 'Internal server error. Please try again';
    case const (ServerFailure400):
      return 'Internal server error. Please try again';
    default:
      return 'Something went wrong. Please try again';
  }
}
