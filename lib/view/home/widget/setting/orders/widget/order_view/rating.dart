import 'package:eccommerce4/controller/setting/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

int? orderid;
final _dialog = RatingDialog(
  initialRating: 1.0,
  // your app's name?
  title: const Text(
    'Order Rating',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  // encourage your user to leave a high rating?
  message: const Text(
    'Tap a star to set your rating. Add more description here if you want.',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 15),
  ),
  // your app's logo?
  image: const FlutterLogo(size: 100),
  submitButtonText: 'Submit',
  commentHint: 'Set your custom comment hint',
  onCancelled: () => print('cancelled'),
  onSubmitted: (response) {
    OrderControllerImp controller = Get.find();
    controller.rating(orderid!, response.rating, response.comment);
    // TODO: add your own logic
    if (response.rating < 3.0) {
      // send their comments to your email or anywhere you wish
      // ask the user to contact you instead of leaving a bad review
    }
  },
);

// show the dialog
showratingDialog(BuildContext context, id) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) {
        print("========= id = $id");
        orderid = id;
        return _dialog;
      });
}
