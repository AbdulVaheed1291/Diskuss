import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit(this.context) : super(TestInitial()) {

    getApi();
  }

  BuildContext context;

  Future<void> getApi() async {
    final url = Uri.parse('http://13.203.24.247:2000/api/v1/card/6734976db6aa50468f64c1a2');

    try {
      emit(TestLoading());

      // Add debug print
      print('Fetching data from API...');

      final response = await http.get(url);

      // Add debug print
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse the JSON data
        final data = jsonDecode(response.body);

        // Add debug print
        print('Decoded data: $data');

        // Check if data is a map (single object) or list
        if (data is Map<String, dynamic>) {
          // If it's a single object, use it directly
          emit(TestLoaded(data));
        } else if (data is List && data.isNotEmpty) {
          // If it's a list, use the first item
          final firstItem = data[0];
          emit(TestLoaded(firstItem));
        } else {
          emit(TestError('Invalid data format received'));
        }
      } else {
        emit(TestError('Failed with status code: ${response.statusCode}'));
      }
    } catch (e, stackTrace) {
      print('Error occurred: $e');
      print('Stack trace: $stackTrace');

      emit(TestError('Error: $e'));
    }
  }
}