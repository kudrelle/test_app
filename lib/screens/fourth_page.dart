import 'package:flutter/material.dart';
import 'package:test_app/screens/fifth_page.dart';
import 'package:test_app/theme/theme.dart';
import 'package:test_app/utils/utils.dart';

class StudentProject {
  final String imagePath;
  final int likes;
  final String name;
  final String authorName;
  const StudentProject(
      {this.imagePath, this.likes, this.name, this.authorName});
}

List<StudentProject> items = [
  StudentProject(
      imagePath: 'assets/images/jesi_1.jpg',
      likes: 15,
      name: 'Self Portrait',
      authorName: 'Laci Jordan'),
  StudentProject(
      imagePath: 'assets/images/cali_1.jpg',
      likes: 11,
      name: 'Letters',
      authorName: 'Laci Jordan'),
  StudentProject(
      imagePath: 'assets/images/jesi_2.jpg',
      likes: 5,
      name: 'Another one',
      authorName: 'Laci Jordan'),
  StudentProject(
      imagePath: 'assets/images/cali_2.jpg',
      likes: 8,
      name: 'Letters',
      authorName: 'Laci Jordan'),
  StudentProject(
      imagePath: 'assets/images/jesi_3.jpg',
      likes: 18,
      name: 'Leo Nx',
      authorName: 'Laci Jordan'),
];

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      appBar: AppBar(
        title: Text(
          'Student Projects',
          style: TextStyles.baseSemiboldStyle
              .copyWith(color: AppColors.darkTextColor),
        ),
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.greyMediumText),
          onPressed: () => Utils.pop(context),
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, count) {
            StudentProject current = items[count];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Utils.navigatePage(context, FifthPage()),
                child: Container(
                  margin: EdgeInsets.only(bottom: 5, top: 20),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.greyLight, width: 2))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: size.width * 0.7,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(current.imagePath),
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 4),
                            margin: EdgeInsets.only(bottom: 10, right: 10),
                            decoration: BoxDecoration(
                              color: AppColors.darkTextColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: AppColors.pinkHeartColor,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(current.likes.toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 15, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              current.name,
                              style: TextStyles.baseBoldStyle
                                  .copyWith(color: AppColors.darkTextColor),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              current.authorName,
                              style: TextStyles.baseStyle
                                  .copyWith(color: AppColors.darkTextColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
