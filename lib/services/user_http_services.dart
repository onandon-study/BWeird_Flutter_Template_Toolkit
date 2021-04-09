
import 'package:get_storage/get_storage.dart';
import 'package:personal_shopper/constant/key.dart';

import 'http_client.dart';

class UserHttpService {
  UserHttpService._();

  static Future<dynamic> userLoginAuthentication(Map body) async {
    const url = "api/clients/login";
    final userResp = await HttpClient.httpPost(url, body);
    print(userResp.body);
    if (userResp != null) {
      String userObj = userResp.body;
      GetStorage storage = GetStorage();
      storage.write(KeyConst.TOKEN_STORE_KEY, userObj);
      return userObj;
    } else {
      return null;
    }
  }
}
