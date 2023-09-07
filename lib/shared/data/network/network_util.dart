import 'package:http/http.dart' as http;

class NetworkUtil {
  // get, post, delete methods
  Future<http.Response> get(String url) async => await http.get(Uri.parse(url));
}