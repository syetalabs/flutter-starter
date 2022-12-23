import '../../models/category.dart';
import '../../models/food.dart';
import '../../models/post_response.dart';

abstract class Api {
  Future<List<Category>> getCategories();

  Future<List<Food>> getFoods(int page,String categoryID);

  Future<ResponseStatus> placeOrder();
}