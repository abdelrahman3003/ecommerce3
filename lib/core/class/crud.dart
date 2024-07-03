import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../functions/checkinternet.dart';
import 'statuscode.dart';

String _basicAuth = 'Basic ' + base64Encode(utf8.encode('temsah13:16797346'));


Map<String, String> myheaders = {'Authorization':_basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> getData(String url, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.get(Uri.parse(url), headers: myheaders);
        if (response.statusCode == 200) {
          Map responsebody = jsonDecode(response.body);
          return right(responsebody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response =
            await http.post(Uri.parse(url), body: data, headers: myheaders);

        if (response.statusCode == 200) {
          Map responsebody = jsonDecode(response.body);

          return right(responsebody);
        } else {
          return left(StatusRequest.serverFailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return left(StatusRequest.exceptionFailure);
    }
  }

  postRequsetWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multypartfile = http.MultipartFile('file', stream, length,
        filename: basename(file.path));
    request.headers.addAll(myheaders);
    request.files.add(multypartfile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error ${myrequest.statusCode}");
    }
  }
}
