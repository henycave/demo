import 'dart:ui';

import 'package:demo/constants.dart';
import 'package:demo/models/timeChoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.dropDownList,
      required this.label,
      required this.onChanged,
      required this.value,
      this.isRound = false,
      required this.controller,
      });

  final List<dynamic> dropDownList;
  final String label;
  final Function onChanged;
  final String value;
  final bool isRound;
  final FixedExtentScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => BackdropFilter(
                filter: ImageFilter.blur(sigmaX:0.0,sigmaY:0.0),
                child: AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  actionsPadding: EdgeInsets.zero,
                  backgroundColor: Colors.black,
                  actions: [
                    const Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    Center(
                        child: MaterialButton(
                      onPressed: () => onChanged(),
                      color: Colors.black,
                      child: const Text(
                        "OK",
                        style: kNormalTextStyle,
                      ),
                    )),
                  ],
                  contentPadding: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  content: SizedBox(
                    height: 240,
                    width: 80,
                    child: CupertinoPicker(
                      scrollController: controller,
                      backgroundColor: Colors.black,
                      itemExtent: 64,
                      //onSelectedItemChanged: (index) => onChanged(index),
                      onSelectedItemChanged: (int value) {  },
                      children: dropDownList
                          .map((e) => Center(
                                  child: Text(
                                isRound? e: e.choice ,
                                style: kMediumTextStyle
                              )))
                          .toList(),
                    ),
                  ),
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent, width: 2.0),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Text(
                value,
                style: kNormalTextStyle,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: kMediumTextStyle,
        )
      ],
    );
  }
}
