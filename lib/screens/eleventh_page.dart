import 'package:flutter/material.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/utils.dart';

class SongItem {
  final String title;
  final String duration;
  final String image;
  SongItem({this.title, this.duration, this.image});
}

class Item {
  final String title;
  final String summary;
  final String image;
  final List<SongItem> songs;
  Item({this.title, this.summary, this.image, this.songs});
}

List<SongItem> songs = [
  SongItem(
      title: 'Sound of Wind',
      duration: '1:34 min',
      image: 'assets/images/11_sound_of_wind.jpg'),
  SongItem(
      title: 'The cry of Insects',
      duration: '1:34 min',
      image: 'assets/images/11_sound_of_wind.jpg'),
  SongItem(
      title: 'Melody of birds',
      duration: '1:34 min',
      image: 'assets/images/11_sound_of_wind.jpg'),
  SongItem(
      title: 'Sound of Wind',
      duration: '1:34 min',
      image: 'assets/images/11_sound_of_wind.jpg'),
  SongItem(
      title: 'The cry of Insects',
      duration: '1:34 min',
      image: 'assets/images/11_sound_of_wind.jpg'),
  SongItem(
      title: 'Melody of birds',
      duration: '1:34 min',
      image: 'assets/images/11_sound_of_wind.jpg'),
];

List<Item> items = [
  Item(
      title: 'Rain',
      image: 'assets/images/11_sound_of_wind.jpg',
      summary: 'Being in the magical forest',
      songs: songs),
  Item(
      title: 'Forest',
      image: 'assets/images/11_04_forest_more.jpg',
      summary: 'Being in the magical forest',
      songs: songs),
  Item(
      title: 'Natural',
      image: 'assets/images/11_sound_of_wind.jpg',
      summary: 'Being in the magical forest',
      songs: songs),
  Item(
      title: 'Flow',
      image: 'assets/images/11_04_forest.png',
      summary: 'Being in the magical forest',
      songs: songs),
  Item(
      title: 'Other',
      image: 'assets/images/11_sound_of_wind.jpg',
      summary: 'Being in the magical forest',
      songs: songs),
];

class EleventhPage extends StatefulWidget {
  @override
  _EleventhPageState createState() => _EleventhPageState();
}

class _EleventhPageState extends State<EleventhPage> {
  int current = 0;
  Item currentItem;

  @override
  void initState() {
    super.initState();
    currentItem = items[current];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Row(
            children: [
              Container(
                width: size.width - 80,
                height: size.height,
                padding: EdgeInsets.only(left: 25, right: 10, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '17 Agustus 1945',
                      style: TextStyles.baseStyle.copyWith(
                          color: AppColors.darkTextColor,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      currentItem.title,
                      style: TextStyles.titleMediumStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      width: size.width,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 12, bottom: 50, left: 10, right: 15),
                            height: 250,
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.greenAccent,
                                        BlendMode.colorBurn),
                                    image: AssetImage(currentItem.image),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.bookmark,
                                      size: 28,
                                      color: AppColors.white,
                                    ),
                                    onPressed: () => Utils.pop(context)),
                                Text(
                                  '0${current + 1}',
                                  style: TextStyles.titleStyle.copyWith(
                                      color: AppColors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  '${currentItem.summary}',
                                  style: TextStyles.baseStyle
                                      .copyWith(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              left: 140,
                              top: 30,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor: AppColors.white,
                                    onPressed: () => Utils.pop(context),
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 38,
                                      color: AppColors.darkTextColor
                                          .withOpacity(0.9),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor: AppColors.white,
                                    onPressed: () => Utils.pop(context),
                                    child: Icon(
                                      Icons.people,
                                      size: 38,
                                      color: AppColors.darkTextColor
                                          .withOpacity(0.9),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor: AppColors.white,
                                    onPressed: () => Utils.pop(context),
                                    child: Icon(
                                      Icons.file_download,
                                      size: 38,
                                      color: AppColors.darkTextColor
                                          .withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: currentItem.songs.length,
                            itemBuilder: (context, index) {
                              SongItem song = currentItem.songs[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: 25),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(song.image),
                                              fit: BoxFit.cover)),
                                      child: index == 0
                                          ? Center(
                                              child: Icon(
                                                Icons.poll,
                                                color: Colors.black87,
                                                size: 30,
                                              ),
                                            )
                                          : null,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          song.title,
                                          style: TextStyles.baseStyle.copyWith(
                                              color: AppColors.darkTextColor),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          song.duration,
                                          style: TextStyles.smallBaseStyle
                                              .copyWith(
                                                  color:
                                                      AppColors.darkTextColor),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }))
                  ],
                ),
              ),
              Container(
                width: 78,
                decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: AppColors.greyLight))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/11_dots.jpg')),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              Item item = items[index];
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      current = index;
                                      currentItem = items[current];
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.symmetric(vertical: 40),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Row(
                                        children: [
                                          Text('•',
                                              style: TextStyles.titleMediumStyle
                                                  .copyWith(
                                                      color: item == currentItem
                                                          ? Colors.blue
                                                          : AppColors.white)),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            item.title.toUpperCase(),
                                            style: TextStyles.baseStyle
                                                .copyWith(
                                                    color: AppColors
                                                        .darkTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 20),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/11_user.png')),
                      ),
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
