import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../constant.dart';
import '../../routes.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstBackColor,
        title: Text('Contact Us'),
        leading:   IconButton(onPressed: (){
          Get.offNamed(AppRoute.setting);
        },
            icon: Icon(Icons.arrow_back)) ,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We value your feedback, inquiries, and concerns. Our dedicated customer support team is here to assist you. There are several ways you can reach us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Text(
              '1.Customer Support Hotline:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Call us at [0950535593] to speak with a representative.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Email :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'weamalkhateeb@gmail.com.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3.Social Media Accounts:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),
            Text(
              '- Facebook:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'https://www.facebook.com/weam.alkhateeb.71?mibextid=ZbWKwL',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '- Instagram:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'https://instagram.com/tuqa_bakr?igshid=MmU2YjMzNjRlOQ==',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}