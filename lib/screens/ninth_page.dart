import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/tenth_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/utils.dart';

class CarouselItem {
  final String image;
  final String text;
  final String title;
  final String time;
  const CarouselItem({this.image, this.text, this.title, this.time});
}

const CarouselItem carouselItem = CarouselItem(
    image: 'assets/images/9-beirut.jpg',
    title: 'Who is responsible for the Beirut disaster?',
    time: 'Opinion • TRT World • 3 horus ago',
    text:
        'The massive exploision that devastated Beirut has understably generated wild speculation, both with Lebanon and beyond, as to its causes and po...');

List<String> titles = ['For you', 'Headlines', 'Folowing', 'Newsstand'];
List<String> tabTitles = [
  'Latest',
  'Indonesia',
  'World',
  'Entertainmet',
  'Sport'
];
List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.bookReader), title: Text('For you')),
  BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.globe), title: Text('Headlines')),
  BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.star), title: Text('Folowing')),
  BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.book), title: Text('Newsstand')),
];

class NinthPage extends StatefulWidget {
  @override
  _NinthPageState createState() => _NinthPageState();
}

class _NinthPageState extends State<NinthPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final CarouselController carouselController = CarouselController();
  int currentTab = 1;
  int current = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: tabTitles.length, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.darkTextColor),
          brightness: Brightness.light,
          elevation: 1,
          centerTitle: true,
          title: Text(
            titles[currentTab],
            style: TextStyles.logoStyle.copyWith(fontSize: 22),
          ),
          actions: <Widget>[
            IconButton(
                icon: Image.asset('assets/images/9-user-image.png'),
                onPressed: () => Utils.navigatePage(context, TenthPage())),
          ],
          leading: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Utils.navigatePage(context, TenthPage())),
          bottom: currentTab == 1
              ? TabBar(
                  isScrollable: true,
                  physics: NeverScrollableScrollPhysics(),
                  tabs: tabTitles.map((t) => Tab(text: t)).toList(),
                  controller: _tabController,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: TextStyles.baseSemiboldStyle,
                  labelColor: AppColors.darkTextColor,
                  unselectedLabelColor: AppColors.darkTextColor,
                )
              : null,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (index) {
            setState(() => currentTab = index);
          },
          type: BottomNavigationBarType.fixed,
          items: bottomItems,
          backgroundColor: AppColors.white,
          elevation: 8,
          selectedItemColor: Colors.blue,
          unselectedItemColor: AppColors.darkTextColor.withOpacity(0.7),
          iconSize: 18,
          selectedLabelStyle:
              TextStyles.baseStyle.copyWith(fontSize: 12, height: 1.6),
          unselectedLabelStyle:
              TextStyles.baseStyle.copyWith(fontSize: 12, height: 1.6),
        ),
        body: currentTab == 1
            ? TabBarView(controller: _tabController, children: [
                CenterWidget(tabTitles[0]),
                CenterWidget(tabTitles[1]),
                SizedBox.expand(
                  child: ListView(
                    children: [
                      Container(
                        height: 320,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Stack(
                          children: [
                            CarouselSlider(
                                carouselController: carouselController,
                                items: List.generate(
                                    7,
                                    (i) => Stack(
                                          children: [
                                            Container(
                                              height: 370,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors.black
                                                                .withOpacity(
                                                                    0.4),
                                                            BlendMode
                                                                .luminosity),
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        carouselItem.image)),
                                              ),
                                            ),
                                            Positioned(
                                                top: 20,
                                                left: 20,
                                                child: Container(
                                                    width:
                                                        screenWidth - 30 - 30,
                                                    child: Text(
                                                      carouselItem.text,
                                                      maxLines: 5,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyles
                                                          .logoStyle
                                                          .copyWith(
                                                              fontSize: 20,
                                                              height: 1.194,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .white,
                                                              backgroundColor:
                                                                  Colors
                                                                      .black54),
                                                    ))),
                                            Positioned(
                                                bottom: 30,
                                                left: 20,
                                                child: Container(
                                                    width:
                                                        screenWidth - 30 - 30,
                                                    child: Text(
                                                      '$i ${carouselItem.title}',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyles
                                                          .logoStyle
                                                          .copyWith(
                                                              fontSize: 22,
                                                              height: 1.3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: AppColors
                                                                  .white),
                                                    ))),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      carouselController
                                                          .previousPage(),
                                                  child: Container(
                                                    width: 50,
                                                    height: 370,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () =>
                                                      carouselController
                                                          .nextPage(),
                                                  child: Container(
                                                    width: 50,
                                                    color: Colors.transparent,
                                                    height: 370,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Positioned(
                                                bottom: 98,
                                                left: 30,
                                                child: Container(
                                                    width:
                                                        screenWidth - 30 - 30,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          carouselItem.time,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyles
                                                              .logoStyle
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  height: 1.3,
                                                                  color: AppColors
                                                                      .white),
                                                        ),
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons.more_vert,
                                                              color: AppColors
                                                                  .white,
                                                            ),
                                                            onPressed: () => Utils
                                                                .navigatePage(
                                                                    context,
                                                                    TenthPage()))
                                                      ],
                                                    ))),
                                          ],
                                        )).toList(),
                                options: CarouselOptions(
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 1),
                                  height: 500.0,
                                  aspectRatio: 10,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) =>
                                      setState(() => current = index),
                                )),
                            Positioned(
                              width: screenWidth - 30,
                              bottom: 6,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(7, (index) {
                                  int total = 7;
                                  return Container(
                                    margin: EdgeInsets.only(left: 3, right: 3),
                                    width: (screenWidth - 30 - 60 - 6 * total) /
                                        total,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: AppColors.white.withOpacity(
                                            current < index ? 0.5 : 1),
                                        borderRadius: BorderRadius.circular(6)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 62,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                          elevation: 2,
                          shadowColor: AppColors.greyLight,
                          color: AppColors.white,
                          child: InkWell(
                            onTap: () =>
                                Utils.navigatePage(context, TenthPage()),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.art_track, color: Colors.blue),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'View Full Coverage',
                                    style: TextStyles.baseStyle
                                        .copyWith(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 40, bottom: 20),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          child: InkWell(
                            onTap: () =>
                                Utils.navigatePage(context, TenthPage()),
                            child: Container(
                              height: 230,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/9-elwood.png'),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.bottomCenter)),
                              child: Center(
                                child: Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: AppColors.white,
                                    size: 60,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CenterWidget(tabTitles[3]),
                CenterWidget(tabTitles[4]),
              ])
            : CenterWidget(titles[currentTab]));
  }
}

class CenterWidget extends StatelessWidget {
  final String title;
  const CenterWidget(this.title);
  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          title,
          style: TextStyles.logoStyle,
        ),
      );
}
