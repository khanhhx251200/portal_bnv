import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:app_mobile/core/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ProcessingStatusScreen extends StatefulWidget {
  const ProcessingStatusScreen({Key key}) : super(key: key);

  @override
  State<ProcessingStatusScreen> createState() => _ProcessingStatusScreenState();
}

class _ProcessingStatusScreenState extends State<ProcessingStatusScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int first = 0;
    int last = 20;
    return Scaffold(
      backgroundColor: kGreyColors.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: kPrimaryColors,
        leading: BackButton(color: kWhiteColors),
        title: Text('Tình hình xử lý hồ sơ',
            style: GoogleFonts.roboto(fontSize: highSize, color: kWhiteColors)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(highSize),
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
          decoration: BoxDecoration(
              color: kWhiteColors,
              borderRadius: BorderRadius.all(Radius.circular(xSmallSize))),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: last,
            itemBuilder: (BuildContext context, int index) {
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.2,
                isFirst: index == first ? true : false,
                isLast: index == last - 1 ? true : false,
                afterLineStyle: LineStyle(color: kGreyColors, thickness: 2),
                beforeLineStyle: LineStyle(color: kGreyColors, thickness: 2),
                indicatorStyle: IndicatorStyle(
                    height: index == first ? mediumSize : xSmallSize,
                    width: index == first ? mediumSize : xSmallSize,
                    color: index == first ? kPrimaryColors : kGreyColors),
                endChild: Container(
                  constraints: const BoxConstraints(
                    minHeight: 50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: smallSize),
                        child: Text('Tình hình xử lý hồ sơ',
                            style: GoogleFonts.roboto(
                                fontSize: mediumSize, color: index == first ? kPrimaryColors : kGreyColors)),
                      ),
                    ],
                  ),
                ),
                startChild: Container(
                  child: Text('20 Th10',
                      style: GoogleFonts.roboto(
                          fontSize: mediumSize, color: kPrimaryColors)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
