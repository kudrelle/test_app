import 'package:flutter/material.dart';
import 'package:test_app/screens/sixth_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/ui/drawer.dart';
import 'package:test_app/utils/utils.dart';

class CollectionItem {
  final String image;
  final String logoImage;
  final String title;
  final String desctription;
  const CollectionItem(
      {this.image, this.logoImage, this.title, this.desctription});
}

List<CollectionItem> gridItems = [
  CollectionItem(
    image: 'assets/images/5-1-1.png',
    logoImage: 'assets/images/5-1-2.png',
    title: 'Van Gogh Museum',
    desctription: 'Amsterdam, Netherlands',
  ),
  CollectionItem(
    image: 'assets/images/5-2-1.png',
    logoImage: 'assets/images/5-2-2.png',
    title: 'MoMA The Museum of Modern Art',
    desctription: 'New York, United States',
  ),
  CollectionItem(
    image: 'assets/images/5-3-1.png',
    logoImage: 'assets/images/5-3-2.png',
    title: 'National Gallery of Art, Washington DC',
    desctription: 'Washington, United States',
  ),
  CollectionItem(
    image: 'assets/images/5-4-1.png',
    logoImage: 'assets/images/5-4-2.png',
    title: 'Musée d\'Orsay, Paris',
    desctription: 'Paris, France',
  ),
  CollectionItem(
    image: 'assets/images/5-1-1.png',
    logoImage: 'assets/images/5-1-2.png',
    title: 'Van Gogh Museum',
    desctription: 'Amsterdam, Netherlands',
  ),
  CollectionItem(
    image: 'assets/images/5-2-1.png',
    logoImage: 'assets/images/5-2-2.png',
    title: 'MoMA The Museum of Modern Art',
    desctription: 'New York, United States',
  ),
  CollectionItem(
    image: 'assets/images/5-3-1.png',
    logoImage: 'assets/images/5-3-2.png',
    title: 'National Gallery of Art, Washington DC',
    desctription: 'Washington, United States',
  ),
  CollectionItem(
    image: 'assets/images/5-4-1.png',
    logoImage: 'assets/images/5-4-2.png',
    title: 'Musée d\'Orsay, Paris',
    desctription: 'Paris, France',
  ),
];

final List<Tab> tabs = <Tab>[
  Tab(text: 'All'),
  Tab(text: 'A-Z'),
  Tab(text: 'Map'),
];

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage>
    with SingleTickerProviderStateMixin {
  Size size;
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
    size = MediaQuery.of(context).size;
    double itemHeight = size.width * 0.8;
    double itemWidth = (size.width - 15) / 2;
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: BaseDrawer(),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.darkTextColor),
        brightness: Brightness.light,
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Google Arts & Culture',
          style: TextStyles.logoStyle,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () => Utils.navigatePage(context, SixthPage())),
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: size.height / 6.5,
              alignment: Alignment.center,
              child: Text(
                'Collections',
                style: TextStyles.titleMediumStyle.copyWith(
                    color: AppColors.darkTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
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
                child: TabBarView(controller: _tabController, children: [
              SizedBox.expand(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: itemWidth / itemHeight),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                itemBuilder: (_, index) {
                  CollectionItem currentItem = gridItems[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Utils.navigatePage(context, SixthPage()),
                      child: Container(
                        height: itemHeight,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 88,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(currentItem.image),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 36,
                              child: Image.asset(currentItem.logoImage,
                                  fit: BoxFit.fitHeight),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              currentItem.title,
                              style: TextStyles.baseSemiboldStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  height: 1.25),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              currentItem.desctription,
                              style: TextStyles.smallBaseStyle.copyWith(
                                  color: AppColors.greyMediumText
                                      .withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: gridItems.length,
              )),
              SizedBox.expand(
                child: Center(
                  child: Text(
                    'A-Z',
                    style: TextStyles.titleStyle
                        .copyWith(color: AppColors.darkTextColor),
                  ),
                ),
              ),
              SizedBox.expand(
                child: Center(
                  child: Text(
                    'Map',
                    style: TextStyles.titleStyle
                        .copyWith(color: AppColors.darkTextColor),
                  ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
