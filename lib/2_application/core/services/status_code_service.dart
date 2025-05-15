import 'package:vicefree/0_data/exceptions/exceptions.dart';

bool statusCodeChecker(int statusCode, String message) {
  if (statusCode != 200) {
    if (statusCode == 400) {
      throw ServerException400(message: message);
    }
    if (statusCode == 401) {
      throw ServerException401();
    }
    if (statusCode == 406) {
      throw ServerException406();
    }
    if (statusCode == 500) {
      throw ServerException500();
    }

    throw GeneralException();
  } else {
    return true;
  }
}
