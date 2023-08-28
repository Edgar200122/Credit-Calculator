import 'package:credit_calculator/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldCalculator extends StatelessWidget {
  const CustomTextFieldCalculator({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.suffixText,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueChanged<int> onChanged;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: Stack(
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textAlignVertical: TextAlignVertical.top,
            maxLength: 12,
            cursorColor: Colors.black,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            onChanged: (text) {
              final newValue = int.tryParse(text) ?? 0;
              onChanged(newValue);
            },
            decoration: InputDecoration(
              counter: const SizedBox.shrink(),
              filled: true,
              fillColor: Color(0xffD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Color(0xffD9D9D9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Color(0xffD9D9D9)),
              ),
            ),
          ),
          Positioned(
            right: 22,
            top: 10,
            bottom: 13,
            child: AppTexts(
              title: suffixText,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xff909090),
            ),
          ),
        ],
      ),
    );
  }
}
