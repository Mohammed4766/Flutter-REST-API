import '../model/post.dart';
import '../helper/api.dart';

class PostApi {
 static Future getPostData() async {
    var result =
        await fetchDataFromApi("https://jsonplaceholder.typicode.com/posts");

    List post = result.map((e) {
      return Post(
        body: e['body'],
        id: e['id'],
        title: e['title'],
        userId: e['userId'],
      );
    }).toList();

    return post;
  }
}
