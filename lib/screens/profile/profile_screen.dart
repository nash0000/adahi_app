import 'package:adahi_app/shared/colors/colors_common.dart';
import 'package:adahi_app/shared/components/components.dart';
import 'package:adahi_app/shared/styles/style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            radius: 45.0,
            backgroundImage: AssetImage('assets/images/fo.jpeg'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nashmeyah Alenezi',
                style: black18Bold(),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 18.0,
                  color: defaultColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
          // Text(
          //  '',
          //  style: black16(),
          // ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'My Shop',
                  shape: Text(
                    '5',
                    style: black20Bold(),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'Favourite Shop',
                  shape: Icon(
                    Icons.favorite_border,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'My Cart',
                  shape: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'My Reviews',
                  shape: Icon(
                    Icons.star_half,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                buildProfileItem(
                  function: () {},
                  title: 'Invite a friend',
                  shape: Icon(
                    Icons.share,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                buildProfileItem(
                  function: () {},
                  title: 'Help & Support',
                  shape: Icon(
                    Icons.help_outline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
