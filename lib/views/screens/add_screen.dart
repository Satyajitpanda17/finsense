import 'package:finsense/common/widgets/custom_textfield.dart';
import 'package:finsense/common/widgets/customdropdown_type.dart';
import 'package:finsense/common/widgets/customdropdownname.dart';
import 'package:finsense/common/widgets/date.dart';
import 'package:finsense/constants/colors.dart';
import 'package:finsense/data/model/add_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<AddData>('data');
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final TextEditingController expalin_C = TextEditingController();
  FocusNode _explain = FocusNode();
   DateTime date = new DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education"
  ];
  final List<String> itemei = [
    'Income',
    "Expense",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                            GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                                            ),
                                            Text(
                        'Adding',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                                            ),
                        Icon(Icons.attach_file_outlined,
                                color: Colors.white, )
                                ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
           Positioned(
            top: 120,
            left: 28,
            child: Container(
              height: 550,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Customdropdownname(
                    selectedItem: selectedItem, 
                    items: _item, 
                    onChanged: (value) {
                       setState(() {
                        selectedItem = value;
                        });
                        },),
                  SizedBox(height: 30,),
                  CustomTextField(
                  label: 'Amount',
                  controller: amount_c,
                  focusNode: amount_,
                   keyboardType: TextInputType.number,
                                  ),
                  SizedBox(height: 30,),
                  CustomTextField(
                  label: 'Explain',
                  controller: expalin_C,
                  focusNode: _explain,
                                  ),
                   SizedBox(height: 30,),
                  CustomdropdownType(
                  selectedItem: selectedItemi,
                    items: itemei,
                     onChanged: (value) {
                            setState(() {
                              selectedItemi = value;
                            });
      },
      hintText: 'How',
    ),
                    SizedBox(height: 30,),
                      CustomDatePicker(
                        selectedDate: date,
                        onDateChanged: (newDate) {
                          setState(() {
                            date = newDate;
                          });
                        },
                      ),        
                      SizedBox(height: 30,),
                      GestureDetector(
                          onTap: () {
                            var add = AddData(
                                 name: selectedItem!, 
                                 explain: expalin_C.text, 
                                 amount: amount_c.text, 
                                 type: selectedItemi!, 
                                 datetime: date
                                 );
                            box.add(add);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff368983),
                            ),
                            width: 120,
                            height: 50,
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontFamily: 'f',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            )
            )
          ],
        )
        ),
    );
  }
}