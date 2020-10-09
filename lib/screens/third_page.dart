import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/fourth_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/const.dart';
import 'package:test_app/utils/utils.dart';
import 'package:test_app/widgets/expandable_text.dart';

List<String> carouselImages = [
  'assets/images/carousel_1.jpg',
  'assets/images/carousel_2.jpg',
  'assets/images/carousel_3.jpg',
  'assets/images/carousel_4.jpg',
  'assets/images/carousel_5.jpg',
];

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final CarouselController carouselController = CarouselController();
  int current = 0;

  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  bool isCurrent(int currentIndex, int checkingIndex) =>
      currentIndex == checkingIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
            onPressed: () => Utils.pop(context)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: AppColors.white,
            ),
            onPressed: () => Utils.navigatePage(context, FourthPage()),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColors.white,
            ),
            onPressed: () => Utils.navigatePage(context, FourthPage()),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          Container(
            height: 500,
            child: Stack(
              children: <Widget>[
                CarouselSlider(
                    carouselController: carouselController,
                    items: carouselImages
                        .map((e) => Container(
                              height: 500,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    // colorFilter: ColorFilter.mode(
                                    //   Colors.black.withOpacity(0.4),
                                    //   BlendMode.luminosity),
                                    fit: BoxFit.cover,
                                    image: AssetImage(e)),
                                // gradient: LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end: Alignment.bottomCenter,
                                //   colors: [gradientStart, gradientEnd],
                                // ),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 500.0,
                      aspectRatio: 10,
                      viewportFraction: 1,
                      initialPage: 0,
                      autoPlay: true,
                      onPageChanged: (index, reason) =>
                          setState(() => current = index),
                    )),
                Positioned(
                    top: 400,
                    height: 100,
                    width: screenWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [gradientStart, gradientEnd],
                        ),
                      ),
                    )),
                Positioned(
                  width: screenWidth,
                  bottom: 10,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: carouselImages.map((e) {
                        int total = carouselImages.length;
                        int currentIndex = carouselImages.indexOf(e);
                        return Container(
                          margin: EdgeInsets.only(left: 3, right: 3),
                          width: (screenWidth - 60 - 6 * total) / total,
                          height: 3,
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(
                                  isCurrent(current, currentIndex) ? 1 : 0.5),
                              borderRadius: BorderRadius.circular(6)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 21, bottom: 35, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Text(
                    ConstText.screen3_top_button,
                    style:
                        TextStyles.allCapsStyle.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  ConstText.screen3_top_title,
                  style: TextStyles.titleStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: AppColors.white.withOpacity(0.95),
                      size: 18,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '4.97',
                      style: TextStyles.baseBoldStyle,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '(423)',
                      style: TextStyles.baseStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  ConstText.screen3_top_place_name,
                  style: TextStyles.baseStyle,
                ),
                SizedBox(
                  height: 15,
                ),
                ButtonBar(
                  // buttonHeight: 12,
                  mainAxisSize: MainAxisSize.min,
                  alignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () =>
                          Utils.navigatePage(context, FourthPage()),
                      color: AppColors.white.withOpacity(0.2),
                      child: Text(
                        ConstText.tag_cooking,
                        style: TextStyles.allCapsStyle
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    FlatButton(
                      onPressed: () =>
                          Utils.navigatePage(context, FourthPage()),
                      color: AppColors.white.withOpacity(0.2),
                      child: Text(
                        ConstText.tag_class,
                        style: TextStyles.allCapsStyle
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 1,
                  color: AppColors.white.withOpacity(0.8),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth / 8, top: 15, bottom: 15),
                  child: Text(
                    ConstText.screen3_between_lines,
                    style: TextStyles.baseStyle,
                  ),
                ),
                Divider(
                  height: 1,
                  color: AppColors.white.withOpacity(0.8),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: AppColors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'Duration',
                          style: TextStyles.baseSemiboldStyle.copyWith(
                              color: AppColors.white.withOpacity(0.8)),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          '1.5 hours',
                          style: TextStyles.baseStyle,
                        ),
                      ],
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.group,
                          color: AppColors.white.withOpacity(0.8),
                          size: 16,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          'Group size',
                          style: TextStyles.baseSemiboldStyle.copyWith(
                              color: AppColors.white.withOpacity(0.8)),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Up to 10 people',
                          style: TextStyles.baseStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth / 8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.comments,
                        color: AppColors.white.withOpacity(0.8), size: 16),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      'Hosted in',
                      style: TextStyles.baseSemiboldStyle
                          .copyWith(color: AppColors.white.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'English, Spanish',
                      style: TextStyles.baseStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            color: AppColors.white,
            padding: EdgeInsets.only(top: 45, bottom: 35, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'What you\'ll do',
                  style: TextStyles.titleMediumStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                ReadMoreText(
                  '''
Immerse yourself in Mexico's extraordinary street food culture in a guided cooking class with a professional chef. Learn to cook a Mexican street taco—including filling, hand-made flour tortillas, and salsa—with practical recipes that you can follow at home. In the first half hour we will have our Welcome, Meet and Greet, Class Structure and Mexican Taco Overview. In the following hour you will cook step by step a delicious Taco from scratch.

This is an online version of our signature “Cook Tacos: Pastor, Barbacoa and Campechano” (https://www.airbnb.com/experiences/260795), an experience that reflects the richness and variety of our tacos. We also host three more experiences on Airbnb with top-rated reviews from around the world: https://www.airbnb.com/users/show/58462173. 

Please review the list of ingredients—if you have any allergies, just let us know, and we can adjust or adapt accordingly. We can also accommodate any specific date/time requests—just message us!

This experience is ideal for special occasions like anniversaries and birthdays as well as for team-building events at work. If you’d like to book for a private group, feel free to write us. 

Pricing is per person. 

For more pictures and stories, please check @auramexcooking

More than 100 classes & 1,000 guests. Honored that this experience has been featured in Huffington Post and Washington Post. Thank You!

                  ''',
                  trimLines: 9,
                  trimMode: TrimMode.Line,
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.greyLight,
            padding: EdgeInsets.only(top: 30, bottom: 35, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Try something new together',
                  style: TextStyles.titleMediumStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  height: 1,
                  color: AppColors.greyMediumText.withOpacity(0.4),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/granny.jpg'),
                    ),
                    SizedBox(
                      width: screenWidth / 15,
                    ),
                    Expanded(
                        child: Text(
                      'Get to know hosts who share their expertise and a window to their world.',
                      maxLines: 5,
                      style: TextStyles.baseTextStyle.copyWith(height: 1.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/people.jpg'),
                    ),
                    SizedBox(
                      width: screenWidth / 15,
                    ),
                    Expanded(
                        child: Text(
                      'Meet people from all over the world while learning something new together.',
                      maxLines: 5,
                      style: TextStyles.baseTextStyle,
                    )),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/laptop.jpg'),
                    ),
                    SizedBox(
                      width: screenWidth / 15,
                    ),
                    Expanded(
                        child: Text(
                      'Join easily and participate from home without a lot of prep.',
                      maxLines: 5,
                      style: TextStyles.baseTextStyle,
                    )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.white,
            padding: EdgeInsets.only(top: 35, bottom: 35, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Your host',
                  style: TextStyles.titleMediumStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                ClipOval(
                  child: Image.asset(
                    'assets/images/graciela1.jpg',
                    fit: BoxFit.cover,
                    height: screenWidth / 2,
                    width: screenWidth / 2,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Graciela',
                  style: TextStyles.titleMediumStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                ReadMoreText(
                  '''
“Hola, I'm Chef Graciela, born and raised in Mexico City. My childhood memories relate to cooking with my Family. In 2009, I created Aura Cocina Mexicana (@auramexcooking), a family business where we’ve hosted international culinary enthusiasts and chefs.

We’ve received the Traveler and Hospitality Award and the Global Quality Award in Culinary Training. Our experiences are considered by Day Tripper as one of the top “10 Things to do while in Mexico City” . Weekly, I host “Tu Cocina” a national public TV Cooking show and I am also a Mexican Chef Ambassador for different projects. 

I am passionate about Mexico’s culinary traditions and I would love to share with you my passion. Let´s Cook! Mi Casa es tu Casa.
                  ''',
                  trimLines: 9,
                  trimMode: TrimMode.Line,
                ),
                SizedBox(
                  height: 20,
                ),
                OutlineButton(
                  onPressed: () => Utils.navigatePage(context, FourthPage()),
                  child: Text(
                    'Contact host',
                    style: TextStyles.baseSemiboldStyle
                        .copyWith(color: AppColors.greenReadMore),
                  ),
                  borderSide:
                      BorderSide(color: AppColors.greenReadMore, width: 2),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
