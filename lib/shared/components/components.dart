import 'package:adahi_app/shared/colors/colors_common.dart';
import 'package:adahi_app/shared/styles/style.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//

//1
Widget defaultButton({
  //Color background = defaultColor,
  double radius = 30.0,
  required Function function,
  required String text,
  bool toUpper = true,
  required double elevation,
}) =>
    Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        // color:Color(0xff9b5de5
        border: Border.all(
          color: Color(0xFF26A69A),
          width: 1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: FlatButton(
        onPressed: function(),
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: green16(),
        ),
        //black16Bold(),
      ),
    );
//2
Widget defaultTextForm({
  required String title,
  String hint = '',
  bool isPassword = false,
  required double elevation,
  required double highlightElevation,
  required TextEditingController controller,
  required TextInputType type,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          6.0,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsetsDirectional.only(
        start: 10.0,
        end: 10.0,
        top: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) detailsText(title),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            keyboardType: type,
          ),
        ],
      ),
    );

//3
Widget headText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 25.0,
      ),
    );

//4
Widget captionText(String text) => Text(
      text,
      style: green18Bold(),
    );

//5
Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
      ),
    );

//6
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//7
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

void navigateAndReplacement(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//8

void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
              SizedBox(
                height: 20.0,
              ),
            if (error)
              defaultButton(
                function: () {
                  Navigator.pop(context);
                },
                text: 'cancel', elevation: 0,
                //elevation: null,
              )
          ],
        ),
      ),
    );
//9
void showToast({
  @required text,
  @required error,
}) =>
    Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
//10class

Widget buildProfileItem({
  @required title,
  required Widget shape,
  @required function,
}) =>
    Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 140.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.0,
                child: shape,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title.toString(),
                style: black16Bold(),
              ),
            ],
          ),
        ),
      ),
    );
//11class
Widget buildSettingItem({@required title, @required function}) => Column(
      children: [
        SizedBox(
          height: 1.0,
        ),
        ListTile(
          tileColor: Colors.white,
          onTap: function,
          title: Text(
            title.toString(),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 14.0,
          ),
        ),
      ],
    );

// 11
// Widget buildButcherItem(butcher) => Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: 20.0,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(
//             15.0,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 10,
//             ),
//           ],
//         ),
//         padding: EdgeInsets.symmetric(
//           vertical: 5.0,
//         ),
//         child: ExpansionTileCard(
//           baseColor: Colors.white,
//           expandedColor: Colors.white,
//           elevation: 0.0,
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: 60.0,
//                 height: 60.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     10.0,
//                   ),
//                   color: defaultColor,
//                   image: DecorationImage(
//                       image: NetworkImage(
//                     butcher['image'],
//                   )),
//                 ),
//               ),
//               SizedBox(
//                 width: 15.0,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             '${butcher['title']}',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: black16Bold(),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                     Text(
//                       '${butcher['description']}',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: grey14(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           onExpansionChanged: (value) {},
//           children: <Widget>[
//             Text('test'),
//           ],
//         ),
//       ),
//     );
