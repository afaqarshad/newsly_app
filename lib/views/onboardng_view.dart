import 'package:flutter/material.dart';
import 'package:newsly_app/Routes/routes_name.dart';
import 'package:newsly_app/components/slider/slider.dart';
import 'package:newsly_app/view_models/onboarding_viewmodel.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                  onPageChanged: (value) {
                    context
                        .read<OnboardingViewModel>()
                        .updatecurrentpage(value);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: context
                      .watch<OnboardingViewModel>()
                      .onBoardingData
                      .length,
                  itemBuilder: (context, index) {
                    return SliderWidget(
                      title: context
                          .watch<OnboardingViewModel>()
                          .onBoardingData[index]['title']!,
                      subtitle: context
                          .watch<OnboardingViewModel>()
                          .onBoardingData[index]['subtitle']!,
                      image: context
                          .watch<OnboardingViewModel>()
                          .onBoardingData[index]['image']!,
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      context
                          .watch<OnboardingViewModel>()
                          .onBoardingData
                          .length,
                      (int index) =>
                          context.watch<OnboardingViewModel>().buildDot(index),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, signup);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff22A45D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFProText',
                              fontSize: 14),
                        ),
                      ),
                    ),
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
