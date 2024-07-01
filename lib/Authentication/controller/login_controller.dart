import 'package:flutter/material.dart';
import 'package:momental/Authentication/pages/login.dart';

import '../../constant/query.dart';
import '../../widgets/show_loading.dart';
import '../models/pengguna.dart';

class LoginFormController extends State<Login> {
  static late LoginFormController instance;
  late Login view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  var db = Database();

  Future<Map<String, dynamic>> doLogin() async {
    Map<String, dynamic> response = {
      "status" : false,
      "message" : "",
    };

    if (!formKey.currentState!.validate()){
      return response; // Formulit ada yang tidak valid
    }
    
    showLoading();
    response = await databaseLoginMatching()
      .then((value){
        hideLoading();
        return value;
      });
    return response;
  }

  Future<Map<String, dynamic>> databaseLoginMatching() async {
    Map<String, dynamic> result = {
      "status" : false,
      "message" : "",
    };

    var queryStr = '''
      SELECT * FROM PENGGUNA WHERE email = '${email!}'
    ''';
    try{
      var temp = await db.query(queryStr, fromMap: (value) => Pengguna.fromMap(value));

      //Pengguna belum terdaftar
      if (temp.isEmpty){ 
        result["status"] = false;
        result["message"] = "Pengguna tidak ditemukan. Email salah.";
        return result;
      }

      // Check Password pengguna dengan inputan
      if (temp[0].password == password){
        result["status"] = true;
        result["message"] = "Berhasil login.";
        return result;
      }

      // Jika pengguna salah memasukan password
      result["status"] = false;
      result["message"] = "Pengguna tidak ditemukan. Password salah.";
      return result;
    } catch (e){
      result["message"] = "Data tidak berhasil dimuat. Harap coba lagi";
      return result;
    }
  }
}