import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_api_5/model/post.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  String apiKey = "39250301-82c95e13e873140cd9dfd6bd9";

  Future<List<Photo>?> fetchedPhotos([String searchedText = ""]) async {
    String api =
        "https://pixabay.com/api/?key=$apiKey&q=$searchedText&orientation=vertical";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String data = response.body;

      Map decodedData = jsonDecode(data);

      List photosData = decodedData['hits'];

      return photosData
          .map((e) => Photo(largeImageURL: e['largeImageURL']))
          .toList();
    }
    return null;
  }
}
