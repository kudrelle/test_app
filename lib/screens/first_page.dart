import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/second_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/utils.dart';

class Item {
  final String image;
  final String category;
  final String title;
  final String text;
  const Item({this.image, this.category, this.title, this.text});
}

List<Item> firstPageItems = [
  Item(
      image: 'assets/images/1-1.jpg',
      category: 'Art Transfer',
      title: 'Transform Your World Into Art',
      text: 'Get creative with Art Transfer'),
  Item(
      image: 'assets/images/1-2.jpg',
      category: 'Art Projector',
      title: 'Hang a Van Gogh in the House',
      text: 'Get creative with Art Projector'),
  Item(
      image: 'assets/images/1-3.jpg',
      category: 'Art Transfer',
      title: 'Transform Your World Into Art',
      text: 'Get creative with Art Transfer'),
  Item(
      image: 'assets/images/1-4.jpg',
      category: 'Art Projector',
      title: 'Hang this picture in the House',
      text: 'Get creative with Art Projector'),
];

List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
  BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.compass), title: Text('Navigate')),
  BottomNavigationBarItem(icon: Icon(Icons.place), title: Text('Places')),
  BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border), title: Text('Likes')),
];

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Play with art using only your phone',
                  maxLines: 3,
                  style: TextStyles.titleMediumStyle.copyWith(
                      color: AppColors.darkTextColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'New ways to experience art from home',
                  maxLines: 3,
                  style: TextStyles.smallBaseStyle.copyWith(
                      color: AppColors.greyMediumText.withOpacity(0.7)),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          ...firstPageItems
              .map((e) => Container(
                    margin: EdgeInsets.only(
                        left: 12, right: 12, top: 5, bottom: 20),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Utils.navigatePage(context, SecondPage()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: (size.width - 24) / 1.8,
                              width: size.width - 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        e.image,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  e.category.toUpperCase(),
                                  style: TextStyles.allCapsStyle.copyWith(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.share,
                                      color: AppColors.darkTextColor,
                                    ),
                                    onPressed: () => Utils.navigatePage(
                                        context, SecondPage())),
                              ],
                            ),
                            Text(
                              e.title,
                              style: TextStyles.baseSemiboldStyle.copyWith(
                                  color: AppColors.darkTextColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              e.text,
                              style: TextStyles.smallBaseStyle.copyWith(
                                  color: AppColors.greyMediumText
                                      .withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
          SizedBox(
            height: 18,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Utils.navigatePage(context, SecondPage()),
        child: Icon(Icons.camera_alt),
        elevation: 3,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.greyMediumText,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: AppColors.white,
        notchMargin: 6.0,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
                onPressed: () => Utils.navigatePage(context, SecondPage()),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.compass,
                    color: AppColors.greyMediumText),
                onPressed: () => Utils.navigatePage(context, SecondPage()),
              ),
              SizedBox(
                width: 70,
              ),
              IconButton(
                icon: Icon(Icons.place, color: AppColors.greyMediumText),
                onPressed: () => Utils.navigatePage(context, SecondPage()),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border,
                    color: AppColors.greyMediumText),
                onPressed: () => Utils.navigatePage(context, SecondPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
