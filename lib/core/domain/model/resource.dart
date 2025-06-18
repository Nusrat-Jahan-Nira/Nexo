// lib/core/common/resource.dart
class Resource<T> {
  final T? data;
  final String? error;
  final int? errorCode;
  final bool isLoading;

  Resource._({
    this.data,
    this.error,
    this.errorCode,
    this.isLoading = false,
  });

  factory Resource.success(T data) {
    return Resource._(
      data: data,
      error: null,
      errorCode: null,
      isLoading: false,
    );
  }

  factory Resource.error(String message, [int? errorCode]) {
    return Resource._(
      data: null,
      error: message,
      errorCode: errorCode,
      isLoading: false,
    );
  }

  factory Resource.loading() {
    return Resource._(
      data: null,
      error: null,
      errorCode: null,
      isLoading: true,
    );
  }

  bool get isSuccess => data != null && error == null && !isLoading;
  bool get isError => error != null && !isLoading;
}