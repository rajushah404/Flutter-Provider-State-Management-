import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    setError(null); // Reset error state before making a new request

    try {
      Response response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        setLoading(false);
      } else {
        // Handle specific error messages from the API
        final errorMessage = _parseErrorResponse(response.body);
        setError(errorMessage ?? "Login failed. Please try again.");
        setLoading(false);
      }
    } catch (e) {
      // Handle network or other exceptions
      setError(
          "An error occurred. Please check your connection and try again.");
      setLoading(false);
    }
  }

  // Helper function to parse error messages from the API response
  String? _parseErrorResponse(String responseBody) {
    try {
      final json = jsonDecode(responseBody);
      return json['error'] as String?;
    } catch (e) {
      return null;
    }
  }
}
