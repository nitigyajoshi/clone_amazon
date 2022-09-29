import 'dart:convert';
import '../constant/utils.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
SnackBar ?httpErrorhandle({
  required http.Response res,
  required BuildContext context,
  required VoidCallback onsucess
}){
  switch(res.statusCode){
    case 200:onsucess();
    break;
    case 400:
      snackbar(context,jsonDecode(res.body)['msg']);
      break;
    case 500:
      snackbar(context, jsonDecode(res.body)['error']);
      break;
    default:
      snackbar(context, res.body);

  }


}