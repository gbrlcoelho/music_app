import 'package:get/get.dart';

mixin ScreenLoadingAndErrorMixin {
  final RxBool _isLoading = true.obs;
  final RxnString _errorMessage = RxnString();

  void setLoadingToTrue() => _isLoading.value = true;

  void setLoadingToFalse() => _isLoading.value = false;

  void setErrorMessage(String? message) => _errorMessage.value = message;

  bool get isLoading => _isLoading.value;

  String? get errorMessage => _errorMessage.value;
}
