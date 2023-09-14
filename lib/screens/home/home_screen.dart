import 'package:cp/constants.dart';
import 'package:cp/screens/searchscreen/search.dart';
import 'package:cp/screens/suggestion/suggestion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../shared/components/tools.dart';
import '../compensation/compensation_screen.dart';
import '../complains/complains_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  OfferWidget(context),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .06),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * .005),
                        child: GridView.count(

                          shrinkWrap: true,
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing:
                              MediaQuery.of(context).size.width * .04,
                          mainAxisSpacing:
                              MediaQuery.of(context).size.width * .04,
                          crossAxisCount: 2,
                          children: <Widget>[
                            items(
                                title: 'الشكاوي',
                                goTo: () {
                                  navigateTo(context, ComplainsScreen());
                                },
                                svgFile: "assets/icons/Parcel.svg"),
                            items(
                                title: 'بحث عن منتج ',
                                goTo: () {
                                  navigateTo(context, SearchCard());
                                },
                                svgFile: "assets/icons/Search Icon.svg"),
                            items(
                                title: 'طلب تعويض',
                                goTo: () {
                                  navigateTo(context, CompensationScreen());
                                },
                                svgFile: "assets/icons/receipt.svg"),
                            items(
                                title: 'اقتراح منتج',
                                goTo: () {
                                  navigateTo(context, SuggScreen());
                                },
                                svgFile: "assets/icons/notes.svg"),
                          ],
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  widgetButtonSwiper({color}) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 10.h,
      width: 10.w,
      decoration: BoxDecoration(
          color: color ?? kPrimaryColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget OfferWidget(context) {
    return Visibility(
        visible: true,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: MediaQuery.of(context).size.height * .20,
              child: Swiper(
                duration: 1500,
                outer: true,
                itemCount: 3,
                autoplay: true,
                layout: SwiperLayout.DEFAULT,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFCDCDCD)),
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ));
                  var i = index;
                },
                pagination: SwiperPagination(builder: SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == config.activeIndex
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: 4,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                )
                              : Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  height: 4,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFCDCDCD),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                      ],
                    ),
                  );
                })),
              ),
            ),
          ],
        ));
  }

  Widget items({title, goTo, svgFile}) {
    return InkWell(
      onTap: goTo,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(2, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Center(
              child: Container(
                width: 60,
                height: 60,
                child: SvgPicture.asset(
                  svgFile,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(25)),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget HomeHeader() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: -2,
                  blurRadius: 9,
                  offset: const Offset(0, 2)),
            ],
          ),
          child: Center(
              child: Text(
            'الرئيسية',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
        ),
      ]);
}
