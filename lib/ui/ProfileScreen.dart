import 'package:flutter/material.dart';
import 'package:shopping_app/images_moke.dart';
import 'package:shopping_app/utilities/customTextStyle.dart';
import 'package:shopping_app/utilities/cutomDrawer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DrawerController _drawerController = new DrawerController(
      child: CustomDrawer(), alignment: DrawerAlignment.end);

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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
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
          ),
          CustomeColumnOfText(
            title1: 'Home Furniture',
            subTitle: "Home accessories, some information about us ",
            titleStyle: customBoldTextStyle(),
            subTitleStyle: customGrayTextStyle(),
          ),
          SizedBox(
            height: 6,
          ),
          CustomeColumnOfText(
            title1: 'Contact us:',
            subTitle: "+925 987 956 8923",
            titleStyle: customBoldTextStyle(),
            subTitleStyle: customBlueTextStyle(),
          ),
          SizedBox(
            height: 6,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Berlin,Germany", style: customGrayTextStyle()),
            ],
          ),
          SizedBox(
            height: 6,
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
            height: 6,
          ),
          Divider(
            height: 1,
          ),
          Container(
            height: 200,
            child: GalaryImageView(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {},
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.home,
                color: Colors.grey[900],
              )),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: '',
              icon: Column(
                children: [
                  Icon(Icons.favorite_border),
                  CircleAvatar(
                    backgroundColor: Colors.red[900],
                    radius: 3,
                  ),
                ],
              )),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.person,
            ),
          )
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
            height: 100,
            width: 100,
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