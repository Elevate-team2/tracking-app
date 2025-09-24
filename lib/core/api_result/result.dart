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
