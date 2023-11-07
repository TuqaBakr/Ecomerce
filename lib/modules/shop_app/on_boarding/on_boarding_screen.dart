

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weam/components/components.dart';
import 'package:weam/models/boardingmodel.dart';
import 'package:weam/modules/shop_app/login_shop/login_shop.dart';
import 'package:weam/routes.dart';
import 'package:weam/services/services.dart';

import '../../../constant.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  MyServices myServices = Get.find();

  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Welcome to'.tr+ 'STUPIFY',
      image: 'assets/images/onboarding1.jpg',
      body: 'We\'re thrilled to have you join our online Stupify shop.'.tr,
    ),
    BoardingModel(
      title: 'Explore Our Product Categories'.tr,
      image: 'assets/images/onboarding2.jpg',
      body: '11'.tr,
    ),
    BoardingModel(
      title: 'Let\'s Get Started!'.tr,
      image: 'assets/images/onboarding3.jpg',
      body: '12'.tr + 'Stupify.'+'Happy shopping!'.tr,
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
              'SKIP'.tr,
              style:const TextStyle(
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
                physics:const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index == boarding.length - 1)
                  {
                    //print('last');
                    setState(()
                    {
                      isLast = true;
                    });
                  }
                  else
                  {
                   // print('not last');
                    setState(()
                    {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),



            ),
            const SizedBox(
              height: 80.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect:const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
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
                        duration:const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child:const Icon(
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
          image: AssetImage(model.image),

        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        model.title,
        style:const TextStyle(
          fontSize: 25.0,
        ),
      ),
      const SizedBox(
        height: 30.0,
      ),
      Text(
        model.body,
        style:const TextStyle(
          fontSize: 15.0,
        ),
      ),
    ],
  );
}
