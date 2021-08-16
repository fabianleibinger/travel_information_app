import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

/// APIProvider serves as the entrance to the backend server.
class APIProvider {
  /// The Backend Server Address.
  final String _serverUrl = 'http://192.168.4.1';

  /// The HTTP status codes.
  static const int OK_STATUS_CODE_SUCCESS = 200;
  static const int CREATED_STATUS_CODE_SUCCESS = 201;

  /// The HTTP Header specifications.
  final String _headerKey = 'Content-Type';
  final String _headerValue = 'application/json; charset=UTF-8';

  /// Returns the response body of the HTTP Get request to [url].
  /// Expects a Json response body.
  /// Throws an [HttpException] with the [failureText].
  Future<Map<String, dynamic>> httpGet(String url, String failureText) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == OK_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException(failureText);
    }
  }

  /// Returns the response body of the HTTP Post request to [url] with [body].
  /// Expects a Json response body.
  /// Throws an [HttpException] with the [failureText].
  Future<Map<String, dynamic>> httpPost(
      String url, Map<String, dynamic> body, String failureText) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          _headerKey: _headerValue,
        },
        body: jsonEncode(body));
    int responseStatus = response.statusCode;
    if (responseStatus == OK_STATUS_CODE_SUCCESS ||
        responseStatus == CREATED_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException(failureText);
    }
  }

  /// Returns the response body of the HTTP Put request to [url] with [body].
  /// Expects a Json response body.
  /// Throws an [HttpException] with the [failureText].
  Future<Map<String, dynamic>> httpPut(
      String url, Map<String, dynamic> body, String failureText) async {
    final response = await http.put(Uri.parse(url),
        headers: <String, String>{
          _headerKey: _headerValue,
        },
        body: jsonEncode(body));
    if (response.statusCode == OK_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException(failureText);
    }
  }

  /// Returns the response body of the HTTP Delete request to [url] with [body].
  /// Expects a Json response body.
  /// Throws an [HttpException] with the [failureText].
  Future<Map<String, dynamic>> httpDelete(
      String url, Map<String, dynamic> body, String failureText) async {
    final response = await http.delete(Uri.parse(url),
        headers: <String, String>{
          _headerKey: _headerValue,
        },
        body: jsonEncode(body));
    if (response.statusCode == OK_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException(failureText);
    }
  }
}
