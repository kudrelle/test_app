import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app/screens/eighth_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/ui/drawer.dart';
import 'package:test_app/utils/utils.dart';

// Bottom tab bar
List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
  BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.compass), title: Text('Navigate')),
  BottomNavigationBarItem(icon: Icon(Icons.place), title: Text('Places')),
  BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border), title: Text('Likes')),
];

// Carousel items
class CarouselItem {
  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const CarouselItem({this.image, this.title, this.subTitle, this.onTap});
}

List<CarouselItem> carouselItems = [
  CarouselItem(
      image: 'assets/images/7-1.jpg',
      title: 'Mediums',
      subTitle: '239 mediums'),
  CarouselItem(
      image: 'assets/images/7-2.jpg',
      title: 'Art movies',
      subTitle: '118 art movies'),
  CarouselItem(
      image: 'assets/images/7-3.jpg', title: 'Mediums', subTitle: '10 mediums'),
  CarouselItem(
      image: 'assets/images/7-4.jpg',
      title: 'Art movies',
      subTitle: '205 art movies'),
  CarouselItem(
      image: 'assets/images/7-5.jpg', title: 'Mediums', subTitle: '97 mediums'),
  CarouselItem(
      image: 'assets/images/7-6.jpg',
      title: 'Art movies',
      subTitle: '54 art movies'),
];

// Search field
class SearchItem {
  final bool isHistory;
  final String title;
  const SearchItem({this.isHistory, this.title});
}

List<SearchItem> searchItems = [
  SearchItem(isHistory: true, title: 'Japan'),
  SearchItem(isHistory: true, title: 'Van Gogh'),
  SearchItem(isHistory: false, title: 'Van Gogh'),
  SearchItem(isHistory: false, title: 'Monet'),
  SearchItem(isHistory: false, title: 'Rembrandt'),
  SearchItem(isHistory: false, title: 'MoMa'),
];

class SeventhPage extends StatefulWidget {
  @override
  _SeventhPageState createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage>
    with SingleTickerProviderStateMixin {
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    VoidCallback onTapItem = () => Utils.navigatePage(context, EighthPage());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: Colors.white,
      drawer: BaseDrawer(),
      appBar: searching
          ? AppBar(
              iconTheme: IconThemeData(
                  color: AppColors.darkTextColor.withOpacity(0.7)),
              brightness: Brightness.light,
              backgroundColor: AppColors.white,
              elevation: 0,
              centerTitle: false,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => setState(() => searching = false)),
              title: Text(
                'Search',
                style: TextStyles.baseSemiboldStyle
                    .copyWith(color: AppColors.darkTextColor.withOpacity(0.7)),
              ),
            )
          : AppBar(
              iconTheme: IconThemeData(color: AppColors.darkTextColor),
              brightness: Brightness.light,
              backgroundColor: AppColors.white,
              elevation: 1,
              centerTitle: false,
              title: Text(
                'Google Arts & Culture',
                style: TextStyles.logoStyle,
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.tap_and_play),
                    onPressed: () => Utils.navigatePage(context, EighthPage())),
                IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () => setState(() => searching = true)),
              ],
            ),
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 25),
                  child: Text('Categories',
                      style: TextStyles.titleMediumStyle.copyWith(
                          color: AppColors.darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300)),
                ),
                Container(
                  height: 265,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carouselItems.length,
                      itemBuilder: (context, index) {
                        CarouselItem item = carouselItems[index];
                        bool isFirst = index == 0;
                        bool isLast = index == carouselItems.length - 1;
                        return Container(
                          margin: isFirst
                              ? EdgeInsets.only(left: 20, right: 4)
                              : !isLast
                                  ? EdgeInsets.only(left: 4, right: 4)
                                  : EdgeInsets.only(left: 4, right: 20),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: onTapItem,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              item.image,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    item.title,
                                    style: TextStyles.baseSemiboldStyle
                                        .copyWith(
                                            color: AppColors.darkTextColor,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    item.subTitle,
                                    style: TextStyles.smallBaseStyle.copyWith(
                                        color: AppColors.greyMediumText
                                            .withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 40, bottom: 25),
                  child: Text('Explore by time and color',
                      style: TextStyles.titleMediumStyle.copyWith(
                          color: AppColors.darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300)),
                ),
                Container(
                  // width: size.width - 40,
                  height: 200,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/7_down.jpg',
                          ))),
                )
              ],
            ),
          ),
          Visibility(
              visible: searching,
              child: SizedBox.expand(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Column(
                        children: searchItems
                            .map(
                              (s) => Container(
                                padding: EdgeInsets.only(left: 20),
                                width: size.width,
                                height: 55,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      s.isHistory
                                          ? Icons.history
                                          : Icons.search,
                                      color: AppColors.darkTextColor
                                          .withOpacity(0.5),
                                      size: 21,
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      s.title,
                                      style: TextStyles.baseSemiboldStyle
                                          .copyWith(
                                              color: AppColors.darkTextColor
                                                  .withOpacity(0.7)),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: Material(
                          color: Colors.black.withOpacity(0.4),
                          child: InkWell(
                            onTap: () => setState(() => searching = false),
                          )),
                    ),
                  ],
                ),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Utils.navigatePage(context, EighthPage()),
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
                onPressed: () => Utils.pop(context),
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.compass,
                    color: AppColors.greyMediumText),
                onPressed: () => Utils.pop(context),
              ),
              SizedBox(
                width: 70,
              ),
              IconButton(
                icon: Icon(Icons.place, color: AppColors.greyMediumText),
                onPressed: () => Utils.pop(context),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border,
                    color: AppColors.greyMediumText),
                onPressed: () => Utils.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
