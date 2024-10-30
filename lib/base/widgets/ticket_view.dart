import 'package:flutter/material.dart';
import 'package:tikkett_app/base/res/styles/app_styles.dart';
import 'package:tikkett_app/base/utils/all_json.dart';
import 'package:tikkett_app/base/widgets/app_colum_text_layout.dart';
import 'package:tikkett_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:tikkett_app/base/widgets/big_cirle.dart';
import 'package:tikkett_app/base/widgets/big_dot.dart';
import 'package:tikkett_app/base/widgets/text_style_fourth.dart';
import 'package:tikkett_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 190,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen==true?0:16),
        child: Column(
          children: [
            //blue part of the tickets
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketBlue,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  //Show departure and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(
                        text: ticket["from"]["code"],
                      ),
                      Expanded(child: Container()),
                      const BigDot(),
                      Expanded(
                          child: Stack(
                        children: [
                          const SizedBox(
                            height: 24,
                            child: AppLayoutbuilderWidget(
                              randomDivider: 6,
                              width: 3,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              child: Icon(Icons.local_airport_rounded,
                                  color: Colors.white),
                              angle: 1.57,
                            ),
                          )
                        ],
                      )),
                      const BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: ticket["to"]["code"],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  //show departure and destination names with time hehehe
                  Row(
                    children: [
                      SizedBox(
                          width: 100, child: TextStyleForth(text: ticket["from"]["name"])),
                      Expanded(child: Container()),
                      TextStyleForth(text: ticket["flying_time"]),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleForth(
                            text: ticket["to"]["name"],
                            alagn: TextAlign.end,
                          ))
                    ],
                  )
                ],
              ),
            ),
            //circles and dots
            Container(
              color: AppStyles.ticketOrange,
              child: const Row(
                children: [
                  BigCirle(
                    isRight: false,
                  ),
                  Expanded(
                      child: AppLayoutbuilderWidget(
                    randomDivider: 10,
                    width: 5,
                  )),
                  BigCirle(
                    isRight: true,
                  )
                ],
              ),
            ),
            //orange part of the tickets
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketOrange,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              child: Column(
                children: [
                  //Show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumTextLayout(
                        topText: ticket["date"],
                        bottomText: "DATE",
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppColumTextLayout(
                        topText: ticket["departure_time"],
                        bottomText: "Departure Time",
                        alignment: CrossAxisAlignment.center,
                      ),
                      AppColumTextLayout(
                        topText: ticket["number"].toString(),
                        bottomText: "Number",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
