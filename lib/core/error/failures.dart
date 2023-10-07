import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String errorMessage;

  ServerFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NetworkFailure extends Failure {
  final String errorMessage;

  NetworkFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class UnhandledFailure extends Failure {
  final String errorMessage;

  UnhandledFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      final e = failure as ServerFailure;
      return e.errorMessage;

    case UnhandledFailure:
      final e = failure as ServerFailure;
      return e.errorMessage;

    case NetworkFailure:
      final e = failure as NetworkFailure;
      return e.errorMessage;
    default:
      return 'Unexpected error';
  }
}
