import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../../../core/models/product_model.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../auth/data/repos/auth_repo_impl.dart';
import '../../../../product details/data/repos/product_details_repo_impl.dart';
import '../../../data/repos/save_adress_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.productDetailsRepo) : super(CartInitial());

  var user = getIt.get<AuthRepoImpl>().myUserModel;

  final ProductDetailsRepoImpl productDetailsRepo;
  final OrdersRepo saveAddressRepo = OrdersRepo(getIt.get<APIService>());

  double totalPrice = 0;

  void calculateTotalPrice() {
    for (int i = 0; i < user.cart!.length; i++) {
      var product = ProductModel.fromMap(user.cart![i]['product']);
      totalPrice += product.price * user.cart![i]['qty'];
    }
    emit(CartQuantityChanges());
  }

  Future<void> onQuantityIncrease({
    required ProductModel product,
    required int quantity,
    required int index,
  }) async {
    totalPrice += product.price;
    int productQuantity = user.cart![index]['qty'];

    if (product.quantity > productQuantity) {
      await productDetailsRepo.addProductToCart(
        product: product,
        quantity: quantity,
      );
    }
    emit(CartQuantityChanges());
  }

  Future<void> onQuantityDecrease({
    required ProductModel product,
  }) async {
    totalPrice -= product.price;
    try {
      await productDetailsRepo.deleteFromCart(
        product: product,
      );
    } catch (e) {}
    emit(CartQuantityChanges());
  }

  List<PaymentItem> get paymentItems => [
        PaymentItem(
          label: 'Total Price',
          amount: totalPrice.toString(),
          status: PaymentItemStatus.final_price,
        ),
      ];

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }

  void onApplePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
  }

  void onCashResult() {
    // Send the resulting Google Pay token to your server / PSP
  }

  Future<void> addNewAddress({required String address}) async {
    await saveAddressRepo.addNewAddress(address: address);
  }

  Future<void> createNewOrder({
    required String address,
    required double totalPrice,
    required String paymentMethod,
  }) async {
    var result = await saveAddressRepo.createNewOrder(
      address: address,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
    );
    result.fold(
      (failure) => emit(
        OrderHasNotBeenCreated(failure.errorMessage),
      ),
      (success) => emit(
        OrderHasBeenCreated(),
      ),
    );
  }
}