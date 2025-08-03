// lib/image_dropdown.dart
import 'package:flutter/material.dart';

class Customdropdownname extends StatelessWidget {
  final String? selectedItem;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final double width;
  final double imageWidth;

  const Customdropdownname({
    Key? key,
    required this.selectedItem,
    required this.items,
    required this.onChanged,
    this.hintText = 'Select',
    this.width = 300,
    this.imageWidth = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffC5C5C5)),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: onChanged,
          items: items.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Row(
                children: [
                  SizedBox(
                    width: imageWidth,
                    child: Image.asset('assets/images/$e.png'),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    e,
                    style: const TextStyle(color : Colors.black,fontSize: 18),
                  ),
                ],
              ),
            );
          }).toList(),
          selectedItemBuilder: (context) => items.map((e) {
            return Row(
              children: [
                SizedBox(
                  width: imageWidth + 2,
                  child: Image.asset('assets/images/$e.png'),
                ),
                const SizedBox(width: 5),
                Text(e , style: TextStyle(color : Colors.black),),
              ],
            );
          }).toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              hintText,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
}
