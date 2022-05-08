// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WomanCard extends StatefulWidget {
  const WomanCard({Key? key}) : super(key: key);

  @override
  State<WomanCard> createState() => _WomanCardState();
}

class _WomanCardState extends State<WomanCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8, crossAxisCount: 2, mainAxisSpacing: 8),
            itemBuilder: (context, index) => WemanCard()),
      ),
    );
  }
}

class WemanCard extends StatefulWidget {
  const WemanCard({Key? key}) : super(key: key);

  @override
  State<WemanCard> createState() => _WemanCardState();
}

class _WemanCardState extends State<WemanCard> {
  @override
  Widget build(BuildContext context) {
    return productCard();
  }
}

class productCard extends StatelessWidget {
  const productCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/3.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Text(
              'data',
              style: TextStyle(color: Colors.grey.withOpacity(0.9)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'data',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz),
                  color: Colors.grey.withOpacity(0.9))
            ],
          ),
        ],
      ),
    );
  }
}



class ExpressCard extends StatefulWidget {
  const ExpressCard({Key? key}) : super(key: key);

  @override
  State<ExpressCard> createState() => _ExpressCardState();
}

class _ExpressCardState extends State<ExpressCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Nothing in Store Right Now"),
    );
  }
}

class ManCard extends StatefulWidget {
  const ManCard({Key? key}) : super(key: key);

  @override
  State<ManCard> createState() => _ManCardState();
}

class _ManCardState extends State<ManCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: height * 0.2,
            width: double.maxFinite,
            color: Color.fromARGB(255, 231, 149, 149),
            child: GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) => ManCatCards(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 6, crossAxisCount: 5, mainAxisSpacing: 6),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: height * 0.8,
            width: double.maxFinite,
            child: GridView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => productCard(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8, crossAxisCount: 2, mainAxisSpacing: 8),
            ),
          ),
        ],
      ),
    );
  }
}

class ManCatCards extends StatelessWidget {
  const ManCatCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
