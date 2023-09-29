import 'dart:ui';

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
      });

  final List<dynamic> dropDownList;
  final String label;
  final Function onChanged;
  final String value;
  final bool isRound;

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<TabataProvider>(context);
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              //barrierColor: Colors.black,
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      child: const Text(
                        "OK",
                        style: TextStyle(color: Colors.white),
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
                      backgroundColor: Colors.black,
                      itemExtent: 64,
                      onSelectedItemChanged: (index) => onChanged(index),
                      children: dropDownList
                          .map((e) => Center(
                                  child: Text(
                                isRound? e: e.choice ,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 32),
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
              //alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25),
              decoration: BoxDecoration(
                //color: Colors.teal,
                border: Border.all(color: Colors.greenAccent, width: 2.0),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        )
      ],
    );
  }
}
