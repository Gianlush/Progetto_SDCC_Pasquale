import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:frontend_sdcc_flutter/utility/Constants.dart';
import 'package:frontend_sdcc_flutter/utility/RestManager.dart';

import '../object/MyFile.dart';
import '../object/User.dart';



class Model {
  static Model sharedInstance = Model();

  final RestManager _restManager = RestManager();

  Future<User> login(String email, String password) async {
    Map<String,String> params = {};
    params['email'] = email;
    params['password'] = sha256.convert(utf8.encode(password)).toString();
    try {
      return User.fromJson(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded)));
    }
    catch(e){
      print(e);
      return null;
    }
  }

  Future<User> signup(User user) async {
    try {
      return User.fromJson(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SIGNUP, user)));
    }
    catch(e){
      print(e);
      return null;
    }
  }

  Future<List<MyFile>> searchFiles({String nome, String estensione, int pageNumber, int pageSize=6, String sortBy="nome", int sortDirection=0}) async {
    Map<String, String> params = {};
    params["nome"] = nome;
    params["estensione"] = estensione;
    params["pageNumber"] = pageNumber.toString();
    params["pageSize"] = pageSize.toString();
    params["sortBy"] = sortBy;
    params['sortDirection'] = sortDirection.toString();
    try {
      return List<MyFile>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_FILES_BY_EXTENSION_OR_NAME, params)).map((i) => MyFile.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      return null; // not the best solution
    }
  }

  Future<MyFile> createFile(MyFile file) async {
    Map<String, String> params = {};
    params["jsonFile"] = jsonEncode(file);
    try{
      return MyFile.fromJson(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_CREATE_FILE, file.bytes, param: params)));
    } catch(e){
      print(e);
      return null;
    }
  }

  Future<Uint8List> getFileBytes(int id) async {
    Map<String, String> params = {};
    params["id"] = id.toString();
    try{
      List<dynamic> byteList = jsonDecode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_GET_FILE_BYTES, params));
      return Uint8List.fromList(byteList.cast<int>());
    } catch(e){
      print(e);
      return null;
    }
  }

}
