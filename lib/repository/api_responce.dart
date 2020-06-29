class ApiResponce<T> {

  T data;
  bool error;
  String errorMessage;

  ApiResponce({this.data,this.errorMessage,this.error=false});
  
}