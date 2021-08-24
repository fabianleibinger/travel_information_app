import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

/// APIProvider serves as the entrance to the backend server.
class ApiProvider {
  /// The Backend Server Address.
  final String _serverUrl = 'http://10.0.2.2:8080/';

  /// The HTTP status codes.
  static const int OK_STATUS_CODE_SUCCESS = 200;
  static const int CREATED_STATUS_CODE_SUCCESS = 201;

  /// The HTTP Header specifications.
  final String _headerKey = 'Content-Type';
  final String _headerValue = 'application/json; charset=UTF-8';

  /// The time span until an error is thrown.
  final Duration _timeout = Duration(seconds: 20);

  /// Returns the response body of the HTTP Get request to [path].
  /// Expects a Json response body.
  /// Throws an [HttpException] with a failure text.
  Future<Map<String, dynamic>> httpGet(String path) async {
    final response =
        await http.get(Uri.parse(_serverUrl + path)).timeout(_timeout);
    if (response.statusCode == OK_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException('failed to get from ' + path + ".");
    }
  }

  /// Returns the response body of the HTTP Post request to [path] with [body].
  /// Expects a Json response body.
  /// Throws an [HttpException] with a failure text.
  Future<Map<String, dynamic>> httpPost(
      String path, Map<String, dynamic> body) async {
    final response = await http
        .post(Uri.parse(_serverUrl + path),
            headers: <String, String>{
              _headerKey: _headerValue,
            },
            body: jsonEncode(body))
        .timeout(_timeout);
    int responseStatus = response.statusCode;
    if (responseStatus == OK_STATUS_CODE_SUCCESS ||
        responseStatus == CREATED_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException('failed to post to ' + path + ".");
    }
  }

  /// Returns the response body of the HTTP Put request to [path] with [body].
  /// Expects a Json response body.
  /// Throws an [HttpException] with a failure text.
  Future<Map<String, dynamic>> httpPut(
      String path, Map<String, dynamic> body) async {
    final response = await http
        .put(Uri.parse(_serverUrl + path),
            headers: <String, String>{
              _headerKey: _headerValue,
            },
            body: jsonEncode(body))
        .timeout(_timeout);
    if (response.statusCode == OK_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException('failed to put to ' + path + ".");
    }
  }

  /// Returns the response body of the HTTP Delete request to [path] with [body].
  /// Expects a Json response body.
  /// Throws an [HttpException] with a failure text.
  Future<Map<String, dynamic>> httpDelete(
      String path, Map<String, dynamic> body) async {
    final response = await http
        .delete(Uri.parse(_serverUrl + path),
            headers: <String, String>{
              _headerKey: _headerValue,
            },
            body: jsonEncode(body))
        .timeout(_timeout);
    if (response.statusCode == OK_STATUS_CODE_SUCCESS) {
      return json.decode(response.body);
    } else {
      throw HttpException('failed to delete from ' + path + ".");
    }
  }
}
