import 'package:flutter/material.dart';
import 'package:shopping_app/images_moke.dart';
import 'package:shopping_app/utilities/customTextStyle.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex =1;
    tabController = TabController(
    length: 3,
    vsync: this
    ,
    );
  }

  grtCircleAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.red[900],
      radius: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: Text("STYLISH"),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      //   endDrawer: CustomDrawer(),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/images/19.jpg'),
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 200,
                  height: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomColumn(
                              text1: "3.500",
                              text2: "posts",
                            ),
                            CustomColumn(
                              text1: "4m",
                              text2: "followers",
                            ),
                            CustomColumn(
                              text1: "500",
                              text2: "following",
                            ),
                          ],
                        ),
                        CustomButton(
                          height: 30,
                          width: 200,
                          buttonTitle: "Edit Profile",
                        )
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            CustomeColumnOfText(
              title1: 'Home Furniture',
              subTitle: "Home accessories, some information about us ",
              titleStyle: customBoldTextStyle(),
              subTitleStyle: customGrayTextStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            CustomeColumnOfText(
              title1: 'Contact us:',
              subTitle: "+925 987 956 8923",
              titleStyle: customBoldTextStyle(),
              subTitleStyle: customBlueTextStyle(),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Berlin,Germany", style: customGrayTextStyle()),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  height: 25,
                  width: 100,
                  buttonTitle: "Add Product",
                ),
                CustomButton(
                  height: 25,
                  width: 100,
                  buttonTitle: "Share",
                ),
                CustomButton(
                  height: 25,
                  width: 100,
                  buttonTitle: "Contact Us",
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              child:  GalaryImageView(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          tabController.animateTo(value);
          currentIndex = value;
          print(value);
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Column(
                children: [
                  Icon(Icons.home, color: Colors.grey[900],),
                  currentIndex == 0 ? Container() : grtCircleAvatar(),
                ],
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Column(
                children: [
                  Icon(Icons.search),
                  currentIndex == 1 ? Container() : grtCircleAvatar(),

                ],
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Column(
                children: [
                  Icon(Icons.favorite_border),
                  currentIndex == 2 ? Container() : grtCircleAvatar(),

                ],
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Column(
                children: [
                  Icon(Icons.person),
                  currentIndex == 3 ? Container() : grtCircleAvatar(),

                ],
              )),
        ],
      ),
    );
  }
}

/// custom button for Edit Button
class CustomButton extends StatefulWidget {
  double height, width;
  String buttonTitle;

  CustomButton({this.height, this.width, this.buttonTitle});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[300],
        ),
        child: FlatButton(
            onPressed: () {},
            child: Text(
              widget.buttonTitle,
              style: customTextStyle(),
            )));
  }
}

/// custom column for general information
class CustomColumn extends StatelessWidget {
  String text1, text2;

  CustomColumn({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text1,
          style: customBoldTextStyle(),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          text2,
          style: customGrayTextStyle(),
        ),
      ],
    );
  }
}

/// custom text column
class CustomeColumnOfText extends StatelessWidget {
  String title1;
  String subTitle;
  TextStyle titleStyle;
  TextStyle subTitleStyle;

  CustomeColumnOfText(
      {this.subTitle, this.subTitleStyle, this.title1, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          title1,
          style: titleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          subTitle,
          style: subTitleStyle,
        ),
      ],
    );
  }
}

/// GalaryImageView for viewing picture
class GalaryImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: imagesList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagesList[index]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(9),
            ),
          );
        });
  }
}
