class ApiResponseModel<T> {
  T data;
  T headers;
  int statusCode;

  ApiResponseModel(this.data, this.headers, this.statusCode);
}
