sealed class Result<T> {
  const Result();
}

class SuccessResult<T> extends Result<T> {
  final T data;
  const SuccessResult(this.data);
}

class FailedResult<T> extends Result<T> {
  final String message;
  final String? error;
  const FailedResult(this.message, [this.error]);
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is SuccessResult<T>;
  bool get isFailure => this is FailedResult<T>;

  T? getOrNull() => this is SuccessResult<T> ? (this as SuccessResult<T>).data : null;
  String? get error =>
      this is FailedResult<T> ? (this as FailedResult<T>).error ?? (this as FailedResult<T>).message : null;
}
