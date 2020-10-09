import 'package:flutter/material.dart';
import 'package:test_app/screens/eleventh_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/utils.dart';

class CollectionItem {
  final Color titleColor;
  final String group;
  final String title;
  final String image;
  final String buttonText;
  const CollectionItem(
      {this.group,
      this.title,
      this.image,
      this.buttonText,
      this.titleColor = Colors.black});
}

class BottomCollectionItem {
  final String image;
  final String country;
  final String title;
  final String price;
  final String rate;
  final String ratesCount;
  const BottomCollectionItem(
      {this.image,
      this.country,
      this.title,
      this.price,
      this.rate,
      this.ratesCount});
}

List<CollectionItem> topItems = [
  CollectionItem(
      group: 'Collection',
      title: 'The show must go online',
      image: 'assets/images/10-top-1.jpg',
      buttonText: 'Show all'),
  CollectionItem(
      group: 'Collection',
      title: 'Most popular around the world',
      image: 'assets/images/10-top-2.jpg',
      buttonText: 'Show all',
      titleColor: AppColors.white),
  CollectionItem(
      group: 'Collection',
      title: 'Meet TikTok\'s top creators',
      image: 'assets/images/10-top-3.jpg',
      buttonText: 'Show all',
      titleColor: AppColors.white),
];

List<BottomCollectionItem> bottomItems = [
  BottomCollectionItem(
      image: 'assets/images/10-bottom-1.jpg',
      country: 'Mexico',
      title: 'Coffee masterclass',
      price: '9',
      rate: '4.97',
      ratesCount: '1482'),
  BottomCollectionItem(
      image: 'assets/images/10-bottom-2.jpg',
      country: 'Spain',
      title: 'Paella experience',
      price: '31',
      rate: '4.97',
      ratesCount: '29'),
  BottomCollectionItem(
      image: 'assets/images/10-bottom-3.jpg',
      country: 'Mexico',
      title: 'Coffee masterclass',
      price: '9',
      rate: '4.97',
      ratesCount: '1482'),
  BottomCollectionItem(
      image: 'assets/images/10-bottom-4.jpg',
      country: 'Spain',
      title: 'Paella experience',
      price: '100',
      rate: '4.5',
      ratesCount: '5'),
  BottomCollectionItem(
      image: 'assets/images/10-bottom-5.jpg',
      country: 'Spain',
      title: 'Paella experience',
      price: '100',
      rate: '4.5',
      ratesCount: '5'),
];

class TenthPage extends StatefulWidget {
  @override
  _TenthPageState createState() => _TenthPageState();
}

class _TenthPageState extends State<TenthPage> {
  ScrollController _controller;
  bool isWhite = false;

  _scrollListener() {
    if (_controller.offset >= 100) {
      // print('');
      setState(() => isWhite = true);
    } else if (_controller.offset < 100) {
      setState(() => isWhite = false);
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        primary: true,
        backgroundColor: isWhite ? AppColors.white : Colors.black,
        leading: Row(
          children: [
            SizedBox(
              width: 6,
            ),
            RawMaterialButton(
                elevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                constraints: BoxConstraints(minHeight: 44, minWidth: 44),
                padding: EdgeInsets.zero,
                fillColor: AppColors.white,
                shape: CircleBorder(),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.darkTextColor,
                ),
                onPressed: () => Utils.pop(context))
          ],
        ),
        actions: [
          RawMaterialButton(
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              constraints: BoxConstraints(minHeight: 44, minWidth: 44),
              padding: EdgeInsets.zero,
              fillColor: AppColors.white,
              shape: CircleBorder(),
              child: Icon(
                Icons.filter_list,
                color: AppColors.darkTextColor,
              ),
              onPressed: () => Utils.navigatePage(context, FilterPage())),
          SizedBox(
            width: 6,
          )
        ],
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'New this week',
                  style: TextStyles.titleStyle.copyWith(color: AppColors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 28),
                width: size.width,
                height: 340,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topItems.length,
                    itemBuilder: (context, index) {
                      CollectionItem item = topItems[index];
                      return Container(
                        width: 260,
                        padding: EdgeInsets.only(
                            top: 25, bottom: 30, left: 15, right: 70),
                        margin: EdgeInsets.only(
                            left: index == 0 ? 28 : 15,
                            right: index == 2 ? 28 : 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(item.image),
                                fit: BoxFit.cover,
                                alignment: Alignment.center)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.group,
                              style: TextStyles.baseSemiboldStyle
                                  .copyWith(color: item.titleColor),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              item.title,
                              style: TextStyles.titleMediumStyle.copyWith(
                                  color: item.titleColor, height: 1.3),
                            ),
                            Expanded(child: SizedBox()),
                            RawMaterialButton(
                              fillColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  side: BorderSide(color: AppColors.greyLight)),
                              onPressed: () =>
                                  Utils.navigatePage(context, EleventhPage()),
                              child: Text(
                                item.buttonText,
                                style: TextStyles.baseSemiboldStyle
                                    .copyWith(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      margin: EdgeInsets.only(bottom: 18),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          RawMaterialButton(
                            focusColor: AppColors.greyLight,
                            highlightColor: AppColors.greyLight,
                            focusElevation: 0,
                            highlightElevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 0,
                            fillColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                    color: AppColors.greyMediumText
                                        .withOpacity(0.2))),
                            onPressed: () =>
                                Utils.navigatePage(context, EleventhPage()),
                            child: Text(
                              'Dates',
                              style: TextStyles.baseStyle
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          Container(
                            width: 1,
                            color: AppColors.greyMediumText.withOpacity(0.2),
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 4, bottom: 4),
                          ),
                          RawMaterialButton(
                            focusColor: AppColors.greyLight,
                            highlightColor: AppColors.greyLight,
                            focusElevation: 0,
                            highlightElevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 0,
                            fillColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                    color: AppColors.greyMediumText
                                        .withOpacity(0.2))),
                            onPressed: () =>
                                Utils.navigatePage(context, EleventhPage()),
                            child: Row(
                              children: [
                                Text(
                                  'Great for groups',
                                  style: TextStyles.baseStyle
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.add,
                                  color: AppColors.greyLight,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          RawMaterialButton(
                            focusColor: AppColors.greyLight,
                            highlightColor: AppColors.greyLight,
                            focusElevation: 0,
                            highlightElevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            elevation: 0,
                            fillColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                    color: AppColors.greyMediumText
                                        .withOpacity(0.2))),
                            onPressed: () =>
                                Utils.navigatePage(context, EleventhPage()),
                            child: Row(
                              children: [
                                Text(
                                  'Friends',
                                  style: TextStyles.baseStyle
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.add,
                                  color: AppColors.greyLight,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: GestureDetector(
                        onTap: () =>
                            Utils.navigatePage(context, EleventhPage()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Text(
                              'Based on experiences you\'ve enjoyed',
                              style: TextStyles.titleMediumStyle
                                  .copyWith(color: Colors.black),
                            )),
                            IconButton(
                                icon: Icon(Icons.chevron_right),
                                onPressed: () =>
                                    Utils.navigatePage(context, EleventhPage()))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 328,
                      child: ListView.builder(
                          itemCount: bottomItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            BottomCollectionItem item = bottomItems[index];
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 15 : 10,
                                  right: index == 4 ? 15 : 0),
                              width: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 160,
                                    height: 210,
                                    alignment: Alignment.topRight,
                                    margin: EdgeInsets.only(bottom: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: AssetImage(item.image),
                                            fit: BoxFit.cover)),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.white,
                                        ),
                                        onPressed: () => Utils.navigatePage(
                                            context, EleventhPage())),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.red,
                                        size: 14,
                                      ),
                                      Text(
                                        item.rate,
                                        style: TextStyles.smallBaseStyle,
                                      ),
                                      Text(
                                        '(${item.ratesCount})・${item.country}',
                                        style: TextStyles.smallBaseStyle
                                            .copyWith(
                                                color: AppColors.darkTextColor
                                                    .withOpacity(0.7)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.title,
                                    maxLines: 2,
                                    style: TextStyles.baseStyle
                                        .copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: 'From \$${item.price}',
                                        style: TextStyles.baseBoldStyle
                                            .copyWith(color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text: ' / person',
                                              style: TextStyles.baseStyle
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                        ]),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues _values = RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.close,
                              color: AppColors.darkTextColor.withOpacity(0.7),
                            ),
                            onPressed: () => Utils.pop(context))
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Price range',
                      style: TextStyles.titleMediumStyle
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      '\$1 - \$100+',
                      style: TextStyles.baseTextStyle
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'The average price of an experience is \$22',
                      style: TextStyles.smallBaseStyle
                          .copyWith(color: Colors.black38),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    RangeSlider(
                        inactiveColor: AppColors.greyLight,
                        activeColor: Colors.black,
                        min: 0,
                        max: 1000,
                        divisions: 10,
                        values: _values,
                        onChanged: (RangeValues newValues) {
                          setState(() => _values = newValues);
                        }),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Time of day',
                      style: TextStyles.titleMediumStyle.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Morning',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Starts before 12 pm',
                      style: TextStyles.smallBaseStyle
                          .copyWith(color: Colors.black38),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Afternoon',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Starts after 12 pm',
                      style: TextStyles.smallBaseStyle
                          .copyWith(color: Colors.black38),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Evening',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Starts after 5 pm',
                      style: TextStyles.smallBaseStyle
                          .copyWith(color: Colors.black38),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Language offered',
                      style: TextStyles.titleMediumStyle.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'English',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'French',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deutch',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Korean',
                          style: TextStyles.baseTextStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 20),
                        ),
                        CustomCheckBox(),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: size.width,
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border(top: BorderSide(color: AppColors.greyLight))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                      color: AppColors.white,
                      onPressed: () => Utils.pop(context),
                      child: Text('Clear all',
                          style: TextStyles.baseStyle
                              .copyWith(color: Colors.black))),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      color: Colors.black,
                      onPressed: () => Utils.pop(context),
                      child: Text(
                        'See experiences',
                        style: TextStyles.baseStyle,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox();
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => checked = !checked),
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: 1),
            shape: BoxShape.rectangle,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(2)),
        child: checked
            ? Icon(
                Icons.check,
                color: Colors.black,
                size: 20,
              )
            : null,
      ),
    );
  }
}
