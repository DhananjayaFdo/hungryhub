class SuccessResponse<T> {
  final String? message;
  final T data;

  SuccessResponse({required this.data, this.message});
}
