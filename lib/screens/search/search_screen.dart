import 'package:flutter/material.dart';
import 'package:tikkett_app/base/res/styles/app_styles.dart';
import 'package:tikkett_app/screens/search/screen/app_text_icon.dart';
import 'package:tikkett_app/screens/search/screen/app_ticket_tabs.dart';
import 'package:tikkett_app/screens/search/screen/find_ticket.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        children: [
          const SizedBox(height: 30,),
          Text("What are\nyou looking for?",style: AppStyles.headLineStyle1.copyWith(fontSize: 35),),
          const SizedBox(height: 20,),
          AppTicketTabs(),
          const SizedBox(height: 25,),
          const AppTextIcon(icon: Icons.flight_takeoff_rounded,text: "Depature",),
          const SizedBox(height: 20,),
          const AppTextIcon(icon: Icons.flight_land_rounded,text: "Arrival",),
          const SizedBox(height: 25,),
          const FindTicket()
        ],
      ),
    );
  }
}
