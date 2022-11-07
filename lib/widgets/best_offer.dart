import 'package:flutter/material.dart';

import 'package:house_rent/models/house.dart';
import 'package:house_rent/screens/details/details.dart';
import 'package:house_rent/widgets/circle_icon_button.dart';

class BestOffer extends StatelessWidget {
  final offerList = House.generateBestOffer();

  BestOffer({Key? key}) : super(key: key);

  _handleNavigateToDetails(BuildContext context, House house) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Details(house: house),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Offer',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...offerList
              .map((offer) => InkWell(
                    onTap: () => {_handleNavigateToDetails(context, offer)},
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 150,
                                height: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(offer.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    offer.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    offer.address,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // const Positioned(
                          //     right: 0,
                          //     child: CircleIconButton(
                          //       iconUrl: 'assets/icons/heart.svg',
                          //       color: Colors.grey,
                          //     ))
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
