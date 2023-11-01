import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:world_news/constants/constants.dart';
import 'package:world_news/controller/news_api_controller.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    var providerwatch = context.watch<NewApiService>();
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(providerwatch
                        .apidata.articles![index].urlToImage
                        .toString()))),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMEd().format(
                      providerwatch.apidata.articles![index].publishedAt!),
                  style: TextStyle(fontSize: 18, color: greyclr),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  providerwatch.apidata.articles![index].author.toString(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryClr),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  providerwatch.apidata.articles![index].title.toString(),
                  style: TextStyle(fontSize: 18, color: primaryClr),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: primaryClr,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Read More",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: whiteclr),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: primaryClr,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark,
                          color: primaryClr,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
