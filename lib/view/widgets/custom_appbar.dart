// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:task5/view/screen/style/colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          )),
      centerTitle: true,
      backgroundColor: whiteColor,
      elevation: 0,
      title: const Text(
        'Product Details',
        style: TextStyle(color: blackColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.infinity,
        200,
      );
}
