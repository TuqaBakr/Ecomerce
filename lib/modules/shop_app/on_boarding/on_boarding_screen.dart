

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weam/components/components.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';

import '../../../constant.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  MyServices myServices = Get.find();

  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Welcome to [STUPIFY]!',
      image: 'assets/images/onboarding1.jpg',
      body: 'We\'re thrilled to have you join our online Stupify shop.',
    ),
    BoardingModel(
      title: 'Explore Our Product Categories',
      image: 'assets/images/onboarding2.jpg',
      body: 'Browse through our intuitive product categories and find the perfect tech companion for your lifestyle, Discover a vast range of electronics tailored to your needs',
    ),
    BoardingModel(
      title: 'Let\'s Get Started!',
      image: 'assets/images/onboarding3.jpg',
      body: 'Now that you know what to expect, it\'s time to embark on your shopping adventure. Dive into a world of innovation, convenience, and unbeatable prices. Enjoy a seamless online shopping experience at [Shop Name]. Happy shopping!',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: sevenBackColor,
        actions: [
          TextButton(onPressed: ()
          {
            Get.offAllNamed(AppRoute.loginShop);
          },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: whiteBackColor,
                fontSize: 15,

              ),
            ),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index == boarding.length - 1)
                  {
                    print('last');
                    setState(()
                    {
                      isLast = true;
                    });
                  }
                  else
                  {
                    print('not last');
                    setState(()
                    {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      myServices.sharedPreferances.setString("onboarding", "1");
                      Get.offAllNamed(AppRoute.loginShop);
                    }
                    else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: firstBackColor,
                  ),)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image:  AssetImage('${model.image}'),

        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    ],
  );
}
