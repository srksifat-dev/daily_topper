class AppExceptions implements Exception{
  final String? _message;
  final String? _prefix;

  AppExceptions([this._message,this._prefix]);

  @override
  String toString(){
    return "$_prefix$_message";
  }
}

class InternetException extends AppExceptions{
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions{
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class InvalidUrl extends AppExceptions{
  InvalidUrl([String? message]) : super(message, "Invalid Url");
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super(message, "Can't fetch data");
}