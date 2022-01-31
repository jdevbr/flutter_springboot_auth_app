import 'package:auth_app/core/config/app_config.dart';
import 'package:auth_app/core/util/string_util.dart';
import 'package:auth_app/core/util/url_util.dart';

class BaseService {
  String path;

  BaseService(this.path);

  Future<String> getTarget() async {
    return await AppConfig.loadEnv().then((value) => value!.apiUrl);
  }

  Future<Uri> getUrl(String path) async {
    String apiUrl = await getTarget();
    String url = UrlUtil.mergeUrl(apiUrl, this.path);
    return UrlUtil.parse(
      StringUtil.isEmpty(path) ? url : UrlUtil.mergeUrl(url, path),
    );
  }
}
