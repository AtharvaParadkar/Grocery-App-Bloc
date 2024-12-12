import 'package:grocery_app_bloc/features/HomeScreen/models/product_data_model.dart';

class WishlistItems {
  List<ProductDataModel> _wishlist = [];
  List<ProductDataModel> get getWishList => _wishlist;

  static final WishlistItems _instance = WishlistItems._internal();

  WishlistItems._internal();

  factory WishlistItems() {
    return _instance;
  }

  void addWishlist(ProductDataModel productDataModel) {
    _wishlist.add(productDataModel);
  }

  void removeWishlist(ProductDataModel productDataModel) {
    _wishlist.remove(productDataModel);
  }

  bool isInWishlist(ProductDataModel productDataModel) {
    return _wishlist.any((product) => product.id == productDataModel.id);
  }
}
