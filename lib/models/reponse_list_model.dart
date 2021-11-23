enum ResponseListState{NONE, EMTY, SHOW,ERROR, LOADING}

class ResponseListModeL<T>{
  ResponseListState? state;
  List<T>? data;

  ResponseListModeL({this.state, this.data});


}