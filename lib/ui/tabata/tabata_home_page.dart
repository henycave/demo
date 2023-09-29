import 'package:demo/providers/tabata_provider.dart';
import 'package:demo/ui/tabata/tabata_timer_page.dart';
import 'package:demo/ui/tabata/widgets/customDropDown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class TabataHomePage extends StatefulWidget {
  const TabataHomePage({Key? key}) : super(key: key);

  @override
  _TabataHomePageState createState() => _TabataHomePageState();
}

class _TabataHomePageState extends State<TabataHomePage> {
  FixedExtentScrollController roundController = FixedExtentScrollController();
  FixedExtentScrollController workController = FixedExtentScrollController();
  FixedExtentScrollController restController = FixedExtentScrollController();


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TabataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
             // Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.save_alt_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              //Navigator.pop(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "TABATA",
                            style: kLargeTextStyle.copyWith(fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Set your Tabata Timer",
                              style:
                                  kNormalTextStyle),
                          CustomDropDown(
                            controller: roundController,
                            dropDownList: roundsDropDownList,
                            label: "Round",
                            onChanged: () {
                              provider.rounds = roundsDropDownList[roundController.selectedItem];
                              Navigator.pop(context);
                            },
                            value: provider.rounds,
                            isRound: true,
                          ),
                          CustomDropDown(
                            controller: workController,
                            dropDownList: workDropDownList,
                            label: "Work",
                            onChanged: () {
                              provider.work = workDropDownList[workController.selectedItem].time;
                              Navigator.pop(context);
                            },
                            value:
                                "${provider.work.inMinutes.remainder(60).toString().padLeft(2, '0')} :${provider.work.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                          ),
                          CustomDropDown(
                            controller: restController,
                            dropDownList: restDropDownList,
                            label: "Rest",
                            onChanged: () {
                              provider.rest = restDropDownList[restController.selectedItem].time;
                              Navigator.pop(context);
                            },
                            value:
                                "${provider.rest.inMinutes.remainder(60).toString().padLeft(2, '0')} :${provider.rest.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add sets(optional)",
                                style: kSmallTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event_note_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Add notes",
                      style: kSmallTextStyle,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    provider.resetFromState();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TabataTimerPage()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "START TIMER",
                            style: kNormalTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "total time: 16:79",
                            style: kSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
