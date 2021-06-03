import 'package:adahi_app/screens/search/cubit/cubit.dart';
import 'package:adahi_app/screens/search/cubit/states.dart';
import 'package:adahi_app/shared/colors/colors_common.dart';
import 'package:adahi_app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryModel {
  String title;
  IconData iconData;
  CategoryModel(this.title, this.iconData);
}

class SearchScreen extends StatelessWidget {
  List<CategoryModel> categoryModel = [
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
    CategoryModel('meat shop', Icons.local_dining_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            // var shops = SearchCubit.get(context).shops;

            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsetsDirectional.only(
                      start: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search ...',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                            color: defaultColor,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: MaterialButton(
                            height: 50.0,
                            onPressed: () {
                              SearchCubit.get(context)
                                  .getSearch(searchController.text);
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        buildSearchItem(categoryModel[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10.0,
                    ),
                    itemCount: categoryModel.length,
                  ),
                ),
                // SizedBox(
                //   height: 15.0,
                // ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 20.0),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildButcherItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ],
            );
          }
          ),
    );
  }

  Widget buildButcherItem() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Web Design',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: black16Bold(),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 10.0,
                            ignoreGestures: true,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'become a web design that looks grate on all devices ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: grey14(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildSearchItem(CategoryModel model) => GestureDetector(
        onTap: () {},
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(
              15.0,
            ),
            // color: defaultColor,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15.0,
                child: Icon(
                  model.iconData,
                  size: 16.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                model.title,
                style: black14Bold(),
              ),
            ],
          ),
        ),
      );
  // RatingBar.builder(
  // initialRating: 3,
  // minRating: 1,
  // direction: Axis.horizontal,
  // allowHalfRating: false,
  // itemCount: 5,
  // itemSize: 10.0,
  // ignoreGestures: true,
  // itemPadding:
  // EdgeInsets.symmetric(horizontal: 0.0),
  // itemBuilder: (context, _) => Icon(
  // Icons.star,
  // color: Colors.amber,
  // ),
  // onRatingUpdate: (rating) {
  // print(rating);
  // },
  // ),
}
