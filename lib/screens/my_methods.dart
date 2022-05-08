// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:secondtask/screens/details_page.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: height * 0.38,
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              "assets/1.jpg",
              fit: BoxFit.cover,
            ),
            height: height * 0.28,
            width: double.maxFinite,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12, right: 12, left: 12),
              color: Colors.white,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "where finishing is just the beginning ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    "New in",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key, required this.shownText}) : super(key: key);
  final String shownText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => DetailsPage()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 8),
        height: 30,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey.withOpacity(0.15)),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey.withOpacity(0.8),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              shownText,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // add the popup window on onTap
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.red,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class CustomBrandRow extends StatelessWidget {
  const CustomBrandRow({
    Key? key,
    required this.rowTitle,
  }) : super(key: key);
  final String rowTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // add the pop up window
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  color: Colors.yellow,
                  // child: Image.asset(""),
                  // add brand image here
                ),
                SizedBox(
                  width: 8,
                ),
                Text(rowTitle),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 14,
            )
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    Key? key,
    required this.rowTitle,
  }) : super(key: key);
  final String rowTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // add the pop up window
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(rowTitle),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 14,
            )
          ],
        ),
      ),
    );
  }
}

class productCard extends StatelessWidget {
  const productCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        width: 220,
        height: height * 0.33,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/1.jpg",
            height: height * 0.25,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6),
            child: Text(
              "where finishing",
              style: TextStyle(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "US\$ 10.06",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ChartsCard extends StatelessWidget {
  const ChartsCard({
    Key? key,
    required this.chartName,
    required this.percentage,
    required this.boldIsTrue,
  }) : super(key: key);
  final String chartName;
  final int percentage;
  final bool boldIsTrue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            chartName,
            style: TextStyle(
                fontWeight:
                    boldIsTrue == true ? FontWeight.w700 : FontWeight.w300),
          ),
          Stack(
            children: [
              Container(
                height: 10,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                height: 10,
                width: 120 * percentage / 100,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
          SizedBox(
            width: 6,
          ),
          Text("$percentage%")
        ],
      ),
    );
  }
}
