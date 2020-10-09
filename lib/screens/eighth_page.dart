import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/ninth_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> dropdownItems = ['New York', 'Paris', 'London'];

final List<Tab> tabs = <Tab>[
  Tab(text: 'Events'),
  Tab(text: 'Organizers'),
];

List<String> chips = [
  'Today',
  'Tomorrow',
  'This weekend',
  'This week',
  'This weekend',
  'This week'
];

List<ListItem> listItems = [
  ListItem(
      image: 'assets/images/8-1.png',
      date: 'Thu, Sep 10 - Wed, Sep 16 • 09:...',
      title: 'New York Fasion Week Fasion Shows & Events S',
      place: 'NYC, NY'),
  ListItem(
      image: 'assets/images/8-2.png',
      date: 'Thu, Aug 20 • 18:30 EDT',
      title: 'Free Networking Event In NYC',
      place: 'Sky Room'),
  ListItem(
      image: 'assets/images/8-3.png',
      date: 'Sat, Aug 29 • 12:00 EDT',
      title: 'Bronx Night Market Opening Dry',
      place: '1 Fordham Plaza'),
  ListItem(
      image: 'assets/images/8-1.png',
      date: 'Thu, Sep 10 - Wed, Sep 16 • 09:...',
      title: 'New York Fasion Week Fasion Shows & Events S',
      place: 'NYC, NY'),
  ListItem(
      image: 'assets/images/8-2.png',
      date: 'Thu, Aug 20 • 18:30 EDT',
      title: 'Free Networking Event In NYC',
      place: 'Sky Room'),
  ListItem(
      image: 'assets/images/8-3.png',
      date: 'Sat, Aug 29 • 12:00 EDT',
      title: 'Bronx Night Market Opening Dry',
      place: '1 Fordham Plaza'),
];

class ListItem {
  final String image;
  final String date;
  final String title;
  final String place;
  const ListItem({this.image, this.date, this.place, this.title});
}

class EighthPage extends StatefulWidget {
  @override
  _EighthPageState createState() => _EighthPageState();
}

class _EighthPageState extends State<EighthPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.greyMediumText),
          onPressed: () => Utils.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/8-top-icon.png',
              width: 24,
            ),
            onPressed: () => Utils.navigatePage(context, NinthPage()),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  'New York',
                  style: TextStyles.baseTextStyle
                      .copyWith(color: AppColors.darkTextColor),
                ),
                SizedBox(
                  width: 8,
                ),
                FaIcon(
                  FontAwesomeIcons.chevronDown,
                  color: AppColors.darkTextColor,
                  size: 12,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              margin: EdgeInsets.only(bottom: 40),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: false,
                    labelText: 'Start searching...',
                    labelStyle: TextStyles.titleStyle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.darkTextColor.withOpacity(0.6))),
              ),
            ),
            SizedBox(
              height: 30,
              width: size.width,
              child: TabBar(
                  indicatorColor: Colors.blue,
                  isScrollable: false,
                  labelColor: AppColors.darkTextColor,
                  unselectedLabelColor:
                      AppColors.darkTextColor.withOpacity(0.7),
                  controller: _tabController,
                  tabs: tabs),
            ),
            Expanded(
                child: TabBarView(
                    dragStartBehavior: DragStartBehavior.down,
                    controller: _tabController,
                    children: [
                  SizedBox.expand(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 55,
                          width: size.width,
                          child: ListView.builder(
                            itemCount: chips.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Chip(
                                  label: Text(chips[index]),
                                  backgroundColor: AppColors.greyLight,
                                )),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 35, left: 15, bottom: 10),
                          child: Text(
                            '15k events',
                            style: TextStyles.titleMediumStyle
                                .copyWith(color: AppColors.darkTextColor),
                          ),
                        ),
                        ...listItems
                            .map((li) => Container(
                                  padding: EdgeInsets.only(left: 15, right: 10),
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(li.image)),
                                            border: Border.all(
                                                color: AppColors.greyLight)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            li.date,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyles.baseSemiboldStyle
                                                .copyWith(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    fontSize: 13),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            li.title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato().copyWith(
                                                color: AppColors.darkTextColor,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                                height: 1.3),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  li.place,
                                                  style: TextStyles
                                                      .baseTextStyle
                                                      .copyWith(
                                                          fontSize: 14,
                                                          color: AppColors
                                                              .darkTextColor
                                                              .withOpacity(
                                                                  0.5)),
                                                ),
                                              ),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.share,
                                                    color:
                                                        AppColors.darkTextColor,
                                                  ),
                                                  onPressed: () =>
                                                      Utils.navigatePage(
                                                          context,
                                                          NinthPage())),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    color:
                                                        AppColors.darkTextColor,
                                                  ),
                                                  onPressed: () =>
                                                      Utils.navigatePage(
                                                          context,
                                                          NinthPage())),
                                            ],
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                  SizedBox.expand(
                    child: Center(
                      child: Text(
                        'Organizers',
                        style: TextStyles.titleStyle
                            .copyWith(color: AppColors.darkTextColor),
                      ),
                    ),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
