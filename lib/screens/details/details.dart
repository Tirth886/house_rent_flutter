import 'package:flutter/material.dart';

import 'package:house_rent/models/house.dart';
import 'package:house_rent/utils/color.dart';
import 'package:house_rent/widgets/about.dart';
import 'package:house_rent/widgets/content_intro.dart';
import 'package:house_rent/widgets/details_app_bar.dart';
import 'package:house_rent/widgets/house_info.dart';

class Details extends StatelessWidget {
  final House house;
  const Details({
    Key? key,
    required this.house,
  }) : super(key: key);

  _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Status"),
      content: const Text("Booking Created successfully."),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsAppBar(house: house),
            const SizedBox(height: 20),
            ContentIntro(house: house),
            const SizedBox(height: 20),
            const HouseInfo(),
            const SizedBox(height: 20),
            const About(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: orangeColors,
                ),
                child: InkWell(
                  onTap: () {
                    _showAlertDialog(context);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
