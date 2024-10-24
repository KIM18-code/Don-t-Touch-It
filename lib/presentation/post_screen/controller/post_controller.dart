import '/core/app_export.dart';
import 'package:grocery_app/presentation/post_screen/models/post_model.dart';

class PostController extends GetxController {
  Rx<PostModel> postModelObj = PostModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
