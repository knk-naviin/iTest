import 'package:fluttertoast/fluttertoast.dart';
import 'package:itest/constants/palette.dart';


void showError(String eMsg) {
  Fluttertoast.showToast(
      msg: eMsg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: errorBg,
      // textColor: Color(0xff23ff4g),
      fontSize: 16.0);
}
