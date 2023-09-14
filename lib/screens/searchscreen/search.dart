import 'package:card_swiper/card_swiper.dart';
import 'package:cp/constants.dart';
import 'package:cp/screens/searchscreen/search_med/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components/tools.dart';
import 'foodstuff_search/foodsearch.dart';

class SearchCard extends StatelessWidget {
  SearchCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(

        child: Column(
          children: [
            OfferWidget(context),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .01),
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * .005),
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: MediaQuery.of(context).size.width * .04,
                    mainAxisSpacing: MediaQuery.of(context).size.width * .04,
                    crossAxisCount: 2,
                    children: [
                      items(
                          title: 'بحث عن دواء ',
                          goTo: () {
                            navigateTo(context, SearchScreen());
                          },
                          svgFile: "assets/icons/notbook.svg"),
                      items(
                          title: 'بحث عن مواد غذائية ',
                          goTo: () {
                            navigateTo(context, SearchScreenFoodStuff());
                          },
                          svgFile: "assets/icons/notbook.svg"),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
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
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
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

}
