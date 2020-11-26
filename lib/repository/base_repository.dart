import 'package:hive/hive.dart';

abstract class SingleKeyRepository<T> {
  /// for single item repository
  Box hiveBox;
  final String key;
  SingleKeyRepository(boxName, this.key) {
    hiveBox = Hive.box(boxName);
  }

  // get item from box
  T get() {
    return hiveBox.get(key);
  }

  /// get item from api
  put(T value) {
    return hiveBox.put(key, value);
  }

  //delete item
  delete() {
    return hiveBox.delete(key);
  }
  /// put data to local
}

abstract class TypeAdapterRepository<T>{
  Box hiveBox;

  TypeAdapterRepository(boxName) {
    hiveBox = Hive.box<T>(boxName);
  }

  T get(key){
    return hiveBox.get(key);
  }

  void put(key,T object){
    hiveBox.put(key,object);
  }
  void delete(key){
    hiveBox.delete(key);
  }

  List<T> getall({startIndex=0,endIndex=50})   // start index and endIndex for pagination
  {
    List<T> data = <T>[];
        int len = hiveBox.length;
        if (len > endIndex) len=endIndex;
        len=len-1;
        while (len>startIndex && len<endIndex){
          len =len-1;
          data.add(hiveBox.getAt(len));
        }

      return data;
  }

  Future<List<T>> getAllNetwork({startIndex=0,endIndex=50})async{
    //
  }
  Future<List<T>> putAll(List<T> data)async{
    //
  }


}



