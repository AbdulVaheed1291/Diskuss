part of 'test_cubit.dart';

@immutable
abstract class TestState {}

class TestInitial extends TestState {}

class TestLoading extends TestState {}
class TestLoaded extends TestState {
  final Map<String, dynamic> data; // Assuming the first item is a JSON object

  TestLoaded(this.data);
}


class TestError extends TestState {
  final String message;

  TestError(this.message);
}
