
import 'package:flutter/material.dart';
import 'package:initial/pages/sample_list.dart';

import '../constant/app_text.dart';
import '../widget/button/general_button.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText.titleLarge("Welcome"),
            GeneralButton(
              buttonColor: Colors.amberAccent,
              elevation: 0,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SampleList()));
              },buttonName:"learn more" ,
            )

          ],
        ),
      ),
    );

  }
}
