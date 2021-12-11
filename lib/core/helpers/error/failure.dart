import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List<dynamic> properties = const <dynamic>[]]);
}

class CacheFailures extends Failure {
  @override
  List<Object?> get props => [];
}
