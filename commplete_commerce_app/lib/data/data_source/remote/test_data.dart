import "../../../core/class/crud.dart";
import "../../../app_links.dart";

class TestData {
  Crud crud;

  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLinks.test, {});
    return response.fold((left) => left, (right) => right);
  }
}
