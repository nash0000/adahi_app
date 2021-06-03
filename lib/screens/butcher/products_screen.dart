import 'package:adahi_app/screens/butcher/cubit/products_cubit.dart';
import 'package:adahi_app/screens/butcher/cubit/products_states.dart';
import 'package:adahi_app/screens/butcher/product_detali/product_detail.dart';
import 'package:adahi_app/shared/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:js/js.dart';
import 'package:adahi_app/shared/components/components.dart';

class CategoryModel {
  String title;
  IconData iconData;
  CategoryModel(this.title, this.iconData);
}

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
    return BlocProvider(
      create: (BuildContext context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(' ProductsScreen'),
              backgroundColor: Colors.teal,
            ),
            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 20.0),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildButcherItem(context),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildButcherItem(context) => GestureDetector(
        onTap: () {
          navigateTo(
              context,
              ProductDetail(
                title: '',
              ));
          //navigateTo(context, RegisterScreen());
        },
        child: Padding(
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
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
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
        ),
      );
}
