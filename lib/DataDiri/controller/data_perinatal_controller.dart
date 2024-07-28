import 'package:flutter/material.dart';

class DataPerinatalController{
  late GlobalKey<FormState> formKey;
  DateTime? hpht;
  DateTime? hpl;
  String? kondisiKehamilan;

  DataPerinatalController(){
    formKey = GlobalKey<FormState>();
  }

  
}