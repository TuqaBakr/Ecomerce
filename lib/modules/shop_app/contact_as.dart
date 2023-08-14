import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../routes.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstBackColor,
        title: const Text('Contact Us'),
        leading:   IconButton(onPressed: (){
          Get.offNamed(AppRoute.setting);
        },
            icon: const Icon(Icons.arrow_back)) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              'We value your feedback, inquiries, and concerns. Our dedicated customer support team is here to assist you. There are several ways you can reach us:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              '1.Customer Support Hotline:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: Text(
                    'Call us at [+963950535593] to speak with a representative.',
                    style: TextStyle(fontSize: 16),
                  ),
              onTap: (){
                launchUrl(Uri.parse("tel:+963950535593"));
              },
              trailing: Icon(Icons.phone_callback_outlined,color:forthBackColor,size: 40,),
            ),
            const SizedBox(height: 16),
            const Text(
              '2. Email :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'weamalkhateeb@gmail.com.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '3.Social Media Accounts:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '- Facebook:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'https://www.facebook.com/weam.alkhateeb.71?mibextid=ZbWKwL',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '- Instagram:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'https://instagram.com/tuqa_bakr?igshid=MmU2YjMzNjRlOQ==',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}