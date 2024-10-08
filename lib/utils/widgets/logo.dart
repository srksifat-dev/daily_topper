import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

Widget logo(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset("assets/images/logo.png"),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "app_name".tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "app_moto".tr,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontFamily: "Roboto",
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
        ],
      )
    ],
  );
}