import 'package:flutter/material.dart';

import '../../constant.dart';

class About_as extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstBackColor,
        title: Text('About Us'),
      ),
      body: ListView(
        children:[ Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to [STUPIFY] Electronics Store',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'At [STUPIFY], our mission is to provide a seamless and enjoyable shopping experience for tech enthusiasts and everyday consumers alike. We strive to offer a comprehensive selection of top-notch electronic products that cater to various needs, from staying connected on the go to transforming homes into smart, efficient spaces.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Unparalleled Quality and Authenticity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We understand the significance of investing in high-quality electronics, which is why we meticulously curate our product offerings. We source our products directly from reputable manufacturers and authorized distributors, ensuring authenticity and reliability. Each product undergoes rigorous quality checks to meet our stringent standards, giving you peace of mind with every purchase.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Exceptional Customer Service',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'At [STUPIFY], we believe in putting our customers first. Our dedicated customer support team is here to assist you every step of the way. Whether you have questions about products, need assistance with your order, or require technical support, our knowledgeable representatives are on hand to provide prompt, friendly, and personalized assistance.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Community and Expertise',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'We\'re not just an electronic shop; we\'re a thriving community of tech enthusiasts. Our blog and social media channels serve as platforms for sharing the latest trends, expert insights, and helpful tips and tricks. Engage with like-minded individuals, expand your knowledge, and stay informed about the ever-evolving world of technology.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
       ],),
    );
  }
}