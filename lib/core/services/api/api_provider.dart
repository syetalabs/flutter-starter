import '../../models/category.dart';
import '../../models/food.dart';
import '../../models/post_response.dart';
import 'api.dart';
import 'api_client.dart';

class ApiProvider implements Api {
  static const String TAG = 'ApiProvider';

  late ApiClient _apiClient;

  static final ApiProvider _singleton = ApiProvider.internal();

  factory ApiProvider(ApiClient apiClient) {
    _singleton._apiClient = apiClient;
    return _singleton;
  }

  ApiProvider.internal();

  @override
  Future<List<Category>> getCategories() {
    return _apiClient.get<List<Category>>(
      '/categories',
    );
  }

  @override
  Future<List<Food>> getFoods(int page, String categoryID) {
    Map<String, dynamic> queryParameters = categoryID == 'all'
        ? {"page": page}
        : {"page": page, "category_id": categoryID};

    return _apiClient.get<List<Food>>(
      '/items',
      queryParameters: queryParameters,
    );
  }

  @override
  Future<ResponseStatus> placeOrder() {
    return _apiClient.post<ResponseStatus>('/placeorder',data: {'id':'something'});
  }
}
