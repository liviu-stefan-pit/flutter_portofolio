import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String message;

  const CustomError({
    this.message = '',
  });

  @override
  String toString() {
    return 'CustomError(errMsg: $message)';
  }

  @override
  List<Object?> get props => [message];
}
