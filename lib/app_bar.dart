import 'package:credit_calculator/app_texts.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.widgetOne,
    this.widgetTwo,
    this.ontap,
  }) : super(key: key);
  final String title;
  final Widget? widgetOne;
  final Widget? widgetTwo;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffF6F6F6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ontap,
            child: SizedBox(
                width: 18, height: 18, child: widgetOne ?? const SizedBox()),
          ),
          AppTexts(
            title: title,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "settings_page");
            },
            child: widgetTwo ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
