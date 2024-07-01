import 'package:flutter/material.dart';
import 'package:momental/Authentication/models/pengguna.dart';

import '../../constant/query.dart';
import '../../widgets/show_loading.dart';
import '../pages/register.dart';

class RegisterFormController extends State<Register> {
  static late RegisterFormController instance;
  late Register view;

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

  String? noTelpon;
  String? email;
  String? password;
  String? password2;

  var db = Database();


  Future<Map<String, dynamic>> doRegister() async{
    Map<String, dynamic> response = {
      "status" : false,
      "message" : "",
    };
    if (!formKey.currentState!.validate()){
      response["message"] = "Input tidak valid";
      return response; // Formulit ada yang tidak valid
    }

    showLoading();

    response = await checkEmailExist().then((value) async {
      if (value["status"]){
        value = await insertIntoDatabase().then((value2) => value2);
      }
      hideLoading();
      return value;
    });

    return response;
  }

  Future<Map<String, dynamic>> checkEmailExist() async {
    Map<String, dynamic> response = {
      "status" : false,
      "message" : "",
    };
    var queryStr = '''
      SELECT * FROM PENGGUNA WHERE email = '${email!}'
    ''';
    try{
      var temp = await db.query(queryStr, fromMap: (value) => Pengguna.fromMap);

      if (temp.length == 0){ //Email belum exist, artinya boleh daftar
        response["status"] = true;
        return response;
      }else{
        response["status"] = false;
        response["message"] = "Gagal melakukan registrasi. Email sudah pernah terdaftar.";
        return response;
      }
    } catch (e){
      response["status"] = false;
      response["Message"] = "There's something wrong with database.";
      return response;
    }
  }

  Future<Map<String, dynamic>> insertIntoDatabase() async {
    Map<String, dynamic> response = {
      "status" : false,
      "message" : "",
    };
    DateTime now = DateTime.now();
    var queryStr = '''
      INSERT INTO PENGGUNA(email, no_telpon, username, password, created_at) VALUES 
      ('${email!}', '${noTelpon!}', 'defaultusername', '${password!}', '$now')
    ''';

    try{
      db.query(queryStr);
      response["status"] = true;
      response["message"] = "Pendaftaran akun berhasil";
      return response;
    } 
    catch (e){
      response["status"] = false;
      response["Message"] = "There's something wrong with database"; 
      return response; 
    }
  }
}